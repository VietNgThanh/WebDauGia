package com.ute.webdaugia.models;

import com.ute.webdaugia.beans.Danh_Gia_NguoiDung;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AccountModel {
    public static void add(User c) {
        String insertSql = "INSERT INTO users(username, password, name, email, address, permission,mark) VALUES (:username,:password,:name,:email,:address,:permission,0)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                .addParameter("username", c.getUsername())
                .addParameter("password", c.getPassword())
                .addParameter("name", c.getName())
                .addParameter("email", c.getEmail())
                .addParameter("address", c.getAddress())
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

    public static void updateProfile(User p) {
        String sql = "UPDATE users SET  username = :username, password = :password, name = :name, email = :email, address = :address, permission = :permission WHERE idUser = :idUser \n";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                .addParameter("username", p.getUsername())
                .addParameter("password", p.getPassword())
                .addParameter("permission", p.getPermission())
                .addParameter("name", p.getName())
                .addParameter("email", p.getEmail())
                .addParameter("address", p.getAddress())
                .addParameter("idUser", p.getIdUser())
                .executeUpdate();
        }
    }
    public static void uptoSeller(User p){
        String sql = "UPDATE users SET  permission = 4 WHERE idUser = :idUser \n";
        try(Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("idUser",p.getIdUser())
                    .executeUpdate();
        }
    }

    public static User findByEmail(String email) {
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

    public static List<Danh_Gia_NguoiDung> HienthiDanhGia(int id_nguoi_duoc_danhgia){
            String sql = "select id_nguoidanhgia,comment,trangthai from danh_gia_nguoidung,users where id_nguoi_duoc_danhgia = :id_nguoi_duoc_danhgia and id_nguoidanhgia = iduser\n" +
                    "order by id desc LIMIT 0,10;";
            try(Connection con =DbUtils.getConnection()) {
                List<Danh_Gia_NguoiDung> danhgia=con.createQuery(sql)
                        .addParameter("id_nguoi_duoc_danhgia",id_nguoi_duoc_danhgia)
                        .executeAndFetch(Danh_Gia_NguoiDung.class);
                if (danhgia.size() == 0) {
                    return null;
                }
                return danhgia;

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

    public static List<Product> HienThiSanPhamDangDauGia(int id_User){
            String sql = " select distinct product.* from product,orders_product where id_User= :id_User and id_Product=product.idProduct and Availability=1;";
            try (Connection con = DbUtils.getConnection()){
                List<Product> dsachsanpham = con.createQuery(sql)
                        .addParameter("id_User",id_User)
                        .executeAndFetch(Product.class);
                if (dsachsanpham.size() == 0) {
                    return null;
                }
                return dsachsanpham;

            }
    }
    public static List<Product> HienThiSanPhamDaThang(int id_User){
        String sql = " select * from product where id_Bidder_current= :id_User and Availability=0;";
        try (Connection con = DbUtils.getConnection()){
            List<Product> dsachdathang = con.createQuery(sql)
                    .addParameter("id_User",id_User)
                    .executeAndFetch(Product.class);
            if (dsachdathang.size() == 0) {
                return null;
            }
            return dsachdathang;

        }
    }
    public static List<Product> HienThiSanPhamDangBan(int User_id){
        String sql = "select * from product where User_id = :User_id;";
        try (Connection con = DbUtils.getConnection()){
            List<Product> dsachban = con.createQuery(sql)
                    .addParameter("User_id",User_id)
                    .executeAndFetch(Product.class);
            if (dsachban.size() == 0) {
                return null;
            }
            return dsachban;

        }
    }
    public static void addDanhGia(Danh_Gia_NguoiDung p){
            String sql = "INSERT INTO danh_gia_nguoidung (id_nguoidanhgia, id_nguoi_duoc_danhgia, comment, trangthai) VALUES (:id_nguoidanhgia, :id_nguoi_duoc_danhgia, :comment, :trangthai)";
            try(Connection con = DbUtils.getConnection()) {
                con.createQuery(sql)
                        .addParameter("id_nguoidanhgia",p.getId_nguoidanhgia())
                        .addParameter("id_nguoi_duoc_danhgia",p.getId_nguoi_duoc_danhgia())
                        .addParameter("comment",p.getComment())
                        .addParameter("trangthai",p.getTrangthai())
                        .executeUpdate();
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
                .addParameter("mark", c.getMark())
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
