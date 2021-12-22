package com.ute.webdaugia.models;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

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
}