package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class OrderModel {
    public static List<Orders> find_top_highest_price() {
        final String query = "SELECT distinct(id_Product) FROM orders_product order by price,id_Product limit 3";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Orders.class);
        }
    }
    public static List<Orders> find_top_count_order(){
        final String query = "select id_Product from(SELECT id_Product,count(idOrder) FROM orders_product\n" +
                "                       group by id_Product\n" +
                "                       order by count(idOrder) desc) as a\n" +
                "limit 3\n";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Orders.class);
        }
    }
    public static List<Orders> find_top_gonna_expire(){
        final String query = "select * from orders_product where rule=1\n" +
                "order by Time_to_close asc limit 3";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Orders.class);
        }
    }
}