package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.beans.SoLuotDauGia;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.ArrayList;
import java.util.List;

public class OrderModel {
//    public static List<Orders> find_top_highest_price() {
//        final String query = "SELECT distinct(idProduct) FROM product order by Current_Price,idProduct limit 6";
//        try (Connection con = DbUtils.getConnection()) {
//            return con.createQuery(query)
//                    .executeAndFetch(Orders.class);
//        }
//    }
    public static List<SoLuotDauGia> find_top_count_order(){
        final String query ="SELECT idProduct,count(idOrder) as soluotragia FROM orders_product,product where idProduct=orders_product.id_Product and Availability=1\n" +
                "        group by idProduct\n" +
                "        order by count(idOrder) desc\n" +
                "        limit 6" ;
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(SoLuotDauGia.class);
        }
    }
    public static ArrayList<Integer> findproductbidderDaugia(int id){
        final String query = "select distinct(id_Product) from orders_product where id_User = :id";
        try (Connection con = DbUtils.getConnection()) {
            ArrayList<Integer> products = (ArrayList<Integer>) con.createQuery(query)
                    .addParameter("id",id)
                    .executeAndFetch(Integer.class);
            if (products.isEmpty()) {
                return null;
            }
            return products;
        }
    }
    public static void deleteOrbyPr(int id){
        String sql = "DELETE FROM orders_product WHERE  id_product = :id;";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }

    public static void deleteOrbyIdUser(int id){
        String sql = "DELETE FROM orders_product WHERE id_User = :id;";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
//    public static List<Orders> find_top_gonna_expire(){
//        final String query = "select * from product order by datediff(time_to_close,now())\n" +
//                "                  limit 6";
//        try (Connection con = DbUtils.getConnection()) {
//            return con.createQuery(query)
//                    .executeAndFetch(Orders.class);
//        }
//    }




}