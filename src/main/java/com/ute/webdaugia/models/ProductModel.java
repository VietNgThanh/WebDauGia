package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.beans.Product;
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
    public static List<Product> findByCatId(int id_Cat) {
        final String query = "select * from product where id_Cat = :id_Cat";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id_Cat", id_Cat)
                    .executeAndFetch(Product.class);
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
                proByCatID.addAll(ProductModel.findByCatId(catId));
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