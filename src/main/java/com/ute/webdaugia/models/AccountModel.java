package com.ute.webdaugia.models;

import com.ute.webdaugia.beans.Danh_Gia_NguoiDung;
import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AccountModel {
        public static void add(User c) {
            String insertSql ="INSERT INTO users(username, password, name, email, address, permission,mark) VALUES (:username,:password,:name,:email,:address,:permission,0)" ;
            try (Connection con = DbUtils.getConnection()) {
                con.createQuery(insertSql)
                        .addParameter("username",c.getUsername())
                        .addParameter("password", c.getPassword())
                        .addParameter("name", c.getName())
                        .addParameter("email", c.getEmail())
                        .addParameter("address",c.getAddress())
                        .addParameter("permission", c.getPermission())
                        .executeUpdate();
            }
        }
    public static User findByusername(String username) {
         String query = "select * from users where username = :username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static User findByidUser(int idUser) {
        String query = "select * from users where iduser = :idUser";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("idUser", idUser)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void updateProfile(User p){
            String sql = "UPDATE users SET  username = :username, password = :password, name = :name, email = :email, address = :address, permission = :permission WHERE idUser = :idUser \n";
            try(Connection con = DbUtils.getConnection()) {
                con.createQuery(sql)
                        .addParameter("username",p.getUsername())
                        .addParameter("password",p.getPassword())
                        .addParameter("permission",p.getPermission())
                        .addParameter("name",p.getName())
                        .addParameter("email",p.getEmail())
                        .addParameter("address",p.getAddress())
                        .addParameter("idUser",p.getIdUser())
                        .executeUpdate();
            }
    }
    public static List<Danh_Gia_NguoiDung> HienthiDanhGia(int id_nguoi_duoc_danhgia){
            String sql ="select name,comment,trangthai\n" +
                    "from danh_gia_nguoidung,users\n" +
                    "where id_nguoidanhgia = iduser and id_nguoi_duoc_danhgia= :id_nguoi_duoc_danhgia\n" +
                    "order by id desc LIMIT 0,10 ;";
            try(Connection con = DbUtils.getConnection()){
                List<Danh_Gia_NguoiDung> list= con.createQuery(sql)
                        .addParameter("id_nguoi_duoc_danhgia",id_nguoi_duoc_danhgia)
                        .executeAndFetch(Danh_Gia_NguoiDung.class);
                if (list.size() == 0) {
                    return null;
                }
                return list;
            }
    }

    public static List<Product> HienThiSanPhamDangDauGia(int id_User){
            String sql="select distinct product.* from product,orders_product where orders_product.id_Product=product.idProduct and orders_product.id_User = :id_User ";
            try(Connection con =DbUtils.getConnection()){
                List<Product> list = con.createQuery(sql)
                        .addParameter("id_User",id_User)
                        .executeAndFetch(Product.class);
                if (list.size() == 0) {
                    return null;
                }
                return list;
            }
    }
    public static User findByEmail(String email){
        String query = "select * from users where email = :email";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
    public static void updateUserFogotPassword(User c) {
        String sql = "UPDATE users SET  username = :username, password = :password, name = :name, email = :email, address = :address, permission = :permission, mark =: mark WHERE idUser = :id \n";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", c.getUsername())
                    .addParameter("password", c.getPassword())
                    .addParameter("name", c.getName())
                    .addParameter("email", c.getEmail())
                    .addParameter("address", c.getAddress())
                    .addParameter("permission", c.getPermission())
                    .addParameter("id", c.getIdUser())
                    .addParameter("mark",c.getMark())
                    .executeUpdate();
        }
    }
//    public static User checkUser(String sdt, String pw){
//         String query = "select * from user where sdt = :sdt and password = :pw";
//        try (Connection con = DbUtils.getConnection()) {
//            List<User> list = con.createQuery(query)
//                    .addParameter("pw", pw)
//                    .addParameter("sdt", sdt)
//                    .executeAndFetch(User.class);
//            if (list.size() == 0) {
//                return null;
//            }
//            return list.get(0);
//        }
   // }
}
