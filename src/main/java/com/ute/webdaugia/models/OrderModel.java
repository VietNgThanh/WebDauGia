package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class OrderModel {
//    public static List<Orders> find_top_highest_price() {
//        final String query = "SELECT distinct(idProduct) FROM product order by Current_Price,idProduct limit 6";
//        try (Connection con = DbUtils.getConnection()) {
//            return con.createQuery(query)
//                    .executeAndFetch(Orders.class);
//        }
//    }
    public static List<Orders> find_top_count_order(){
        final String query = "select id_Product from(SELECT id_Product,count(idOrder) FROM orders_product,product where idProduct=orders_product.id_Product and Availability=1\n" +
                "                                      group by id_Product\n" +
                "                                       order by count(idOrder) desc) as a\n" +
                "                limit 6";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Orders.class);
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