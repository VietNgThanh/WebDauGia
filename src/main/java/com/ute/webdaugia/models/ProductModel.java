package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.*;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
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
    public static List<TuChoiBidder> listTuchoi(){
        final String sql ="select id_product,id_bidder from tu_choi_bidder";
        try (Connection con = DbUtils.getConnection()){
            List<TuChoiBidder> list = con.createQuery(sql)
                    .executeAndFetch(TuChoiBidder.class);
            if (list.size() == 0) {
                return null;
            }
            return list;
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
    public static void addTuchoiBidderRagia(int id_product,int id_bidder){
        String sql ="INSERT INTO tu_choi_bidder(id_product,id_bidder) VALUES(:id_product,:id_bidder);";
        try(Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id_product",id_product)
                    .addParameter("id_bidder",id_bidder)
                    .executeUpdate();
        }
    }
    public static List<Product> findByIdWatList(int id_user) {
        final String query = "select product.* from product inner join wish_list\n" +
                "on product.idProduct = wish_list.id_product and id_user= :id_user";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id_user",id_user)
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
    public static Integer SoluotraGia(int id_Product){
        final String sql =" select COUNT(idOrder) from orders_product where id_Product= :id_Product;";
        try (Connection con = DbUtils.getConnection()) {
            List<Integer>  list =  con.createQuery(sql)
                    .addParameter("id_Product", id_Product)
                    .executeAndFetch(Integer.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static List<SoLuotDauGia> SoluotraGiaByCat(int id_Cat){
        final String sql =" select idProduct,count(idOrder) as soluotragia from orders_product,product where\n" +
                "idProduct=orders_product.id_Product and id_Cat= :id_Cat group by idProduct;";
        try (Connection con = DbUtils.getConnection()) {
            List<SoLuotDauGia>  list =  con.createQuery(sql)
                    .addParameter("id_Cat", id_Cat)
                    .executeAndFetch(SoLuotDauGia.class);
            if (list.size() == 0) {
                return null;
            }
            return list;
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
    public static void Add_Seller_Product(Product a){
        String sql ="insert into product(Name, id_Cat, User_id, Detail_tiny," +
                " Detail_full, Start_price, Imme_Price, highest_price, buoc_nhay,check_delay,Availability,dathongbao) " +
                "values (:ProName ,:idCat,2,:TinyDes,:FullDes,:StartPrice,:ImmePrice,:StartPrice,:buocnhay,:check_delay,1,0)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("ProName", a.getName())
                    .addParameter("TinyDes", a.getDetail_tiny())
                    .addParameter("FullDes", a.getDetail_full())
                    .addParameter("StartPrice", a.getStart_price())
                    .addParameter("ImmePrice", a.getImme_Price())
                    .addParameter("buocnhay", a.getBuoc_nhay())
                    .addParameter("idCat", a.getIdCat())
//                    .addParameter("idUser", a.getUserid())
                    .addParameter("check_delay",a.getCheck_delay())
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
        String sql ="INSERT INTO orders_product(id_Product,id_User,Price) VALUES(:id_Product,:id_User, :Price)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id_Product", p.getId_Product())
                    .addParameter("id_User", p.getId_User())
                    .addParameter("Price", p.getPrice())
                    .executeUpdate();
        }
    }
    public static List<Orders> LichSuDauGia(int id_Product){
        String sql = "select id_User,current_price,Time_make_price from orders_product where id_Product= :id_Product order by idOrder desc;";
        try (Connection con = DbUtils.getConnection()){
          List<Orders> lichsu =  con.createQuery(sql)
                    .addParameter("id_Product",id_Product)
                    .executeAndFetch(Orders.class);
            if (lichsu.size() == 0) {
                return null;
            }
            return lichsu;
        }
    }
    public static List<User> danhsachtenUser(){
        String sql = "select * from users";
        try (Connection con = DbUtils.getConnection()) {
            List<User> listuser= con.createQuery(sql)
                    .executeAndFetch(User.class);
            if (listuser.size() == 0) {
                return null;
            }
            return listuser;
        }
    }

    public static List<Product> findBySearch(String txtSearch, String show) {
        final String queryProducts = "SELECT * FROM product WHERE MATCH(Name) AGAINST('" + txtSearch + "')";
        final String queryCat = "SELECT * FROM childcategory WHERE MATCH(name) AGAINST('" + txtSearch + "')";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> products = new ArrayList<>();
            if (!Objects.equals(show, "cat")) {
                products = con.createQuery(queryProducts)
                    .executeAndFetch(Product.class);
            }

            if (!Objects.equals(show, "name")) {
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
                    } catch (NullPointerException e) {
                    }
                }
                for (Product pro : proByCatID) {
                    if (!proIds.contains(pro.getIdProduct())) {
                        products.add(pro);
                    }
                }
            }
            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }
    public static List<Product> find_top_highest_price() {
        final String query = "SELECT * FROM product where availability=1 order by Current_Price desc limit 6\n";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> find_top_gonna_expire(){
        final String query = "select * from product where availability=1 order by datediff(time_to_close,now())\n" +
                "                  limit 6";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> find_all_product_per1(){
        final String query = "select idProduct,date_sub(time_to_close,interval 7 day ) as a from product" ;

        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static ArrayList<Product> findProductAvai() {
        final String query = "SELECT idProduct, Name, id_Cat, User_id, Detail_tiny, Detail_full, Start_price, Imme_Price, Availability, Current_Price, id_ParentCat, id_Bidder_current, highest_price, buoc_nhay, dathongbao, time_to_close FROM product WHERE Availability = 1 and dathongbao = 0  \n";
        try (Connection con = DbUtils.getConnection()) {
            ArrayList<Product> products = (ArrayList<Product>) con.createQuery(query)
                    .executeAndFetch(Product.class);
            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }
    public static void updateTrangThai(int id) {
        String sql ="UPDATE product SET Availability = 0, dathongbao =1 where idProduct = :idProduct ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idProduct", id)
                    .executeUpdate();
        }
    }
}