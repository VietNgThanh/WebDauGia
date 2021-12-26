package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.*;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductModel {
    public static List<Product> findAll() {
        final String query = "select * from product";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Wishlist> findAllWList(int id_user) {
        final String query = "select * from wish_list WHERE id_user = :id_user";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id_user", id_user)
                    .executeAndFetch(Wishlist.class);
        }
    }
    public static List<Product> findByCatId(int id_Cat) {
        final String query = "select * from product where id_Cat = :id_Cat";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> products = con.createQuery(query)
                    .addParameter("id_Cat", id_Cat)
                    .executeAndFetch(Product.class);

            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }
    public static Product findById(int id) {
        final String query = "select * from product where idProduct = :idProduct";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("idProduct", id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void deteleProduct(int id){
        String sql = "DELETE FROM product where idProduct =:id \n";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
    public static List<Product> findbySeller(int id) {
        final String query = "select * from product where User_id = :User_id";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("User_id", id)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findbyparentID(int id) {
        final String query = "select * from product where id_ParentCat = :id_ParentCat";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> products = con.createQuery(query)
                    .addParameter("id_ParentCat", id)
                    .executeAndFetch(Product.class);

            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }

    public static void addWatchList(int id_user, int id_product){
        String sql ="INSERT INTO wish_list(id_user,id_product) VALUES(:id_user,:id_product)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id_user", id_user)
                    .addParameter("id_product", id_product)
                    .executeUpdate();
        }
    }
    public static List<Product> findByIdWatList() {
        final String query = "select idProduct,Name,id_Cat,User_id,Detail_tiny,Detail_full,Start_price,Imme_Price,Availability,Current_Price,id_ParentCat from product inner join wish_list\n" +
                "on product.idProduct = wish_list.id_product";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static Integer findidCatByidproduct(int id_product){
        final String query="select * from product where idProduct =:id_product;";
        try (Connection con = DbUtils.getConnection()) {
            List<Product>  list =  con.createQuery(query)
                    .addParameter("id_product", id_product)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0).getIdCat();
        }
    }
    public static void delWatchList(int id_user, int id_product) {
        String sql = "DELETE FROM wish_list WHERE id_user = :id_user and id_product = :id_product;";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id_user", id_user)
                    .addParameter("id_product", id_product)
                    .executeUpdate();
        }

    }
    public static User diemdanhgia(int id_user){
        String sql = "select * from users where iduser= :id_user;";
        try (Connection con = DbUtils.getConnection()) {
           List<User> mark = con.createQuery(sql)
                    .addParameter("id_user", id_user)
                    .executeAndFetch(User.class);
            if (mark.size() == 0) {
                return null;
            }
            return mark.get(0);
        }
    }
    public static void BiderRaGia(Orders p){
        String sql ="INSERT INTO orders_product(id_Product,id_User,Price,rule) VALUES(:id_Product,:id_User, :Price,0)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id_Product", p.getId_Product())
                    .addParameter("id_User", p.getId_User())
                    .addParameter("Price", p.getPrice())
                    .executeUpdate();
        }
    }

    public static List<Product> findBySearch(String txtSearch) {
        final String queryProducts = "SELECT * FROM product WHERE MATCH(Name) AGAINST('" + txtSearch + "')";
        final String queryCat = "SELECT * FROM childcategory WHERE MATCH(name) AGAINST('" + txtSearch + "')";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> products = con.createQuery(queryProducts)
                .executeAndFetch(Product.class);
            List<Integer> proIds = products
                .stream().map(Product::getIdProduct)
                .collect(Collectors.toList());
            List<Integer> catIdsSearchByCatName = con.createQuery(queryCat)
                .executeAndFetch(ChildCategory.class)
                .stream().map(ChildCategory::getId)
                .collect(Collectors.toList());
            List<Product> proByCatID = new ArrayList<>();
            for (int catId : catIdsSearchByCatName) {
                try {
                    proByCatID.addAll(ProductModel.findByCatId(catId));
                }
                catch (NullPointerException e){}
            }
            for (Product pro : proByCatID) {
                if (!proIds.contains(pro.getIdProduct())) {
                    products.add(pro);
                }
            }
            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }
}