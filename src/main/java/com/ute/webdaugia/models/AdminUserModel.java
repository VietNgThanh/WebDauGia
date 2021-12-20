package com.ute.webdaugia.models;

import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AdminUserModel {

    public static List<User> findAllUser() {
        final String query = "select users.id,users.username,users.password,users.name,users.email,users.address,users.permission from users inner join dkiseller on users.id = dkiseller.id_user";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
        }
    }
    public static void uptoSeller(int id){
        String sql = "UPDATE users SET permission = 2 WHERE id =:id \n";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
    public static void deteleDki(int id){
        String sql = "DELETE FROM dkiseller where id_user =:id \n";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
    public static List<User> findAllSeller() {
        final String query = "select * from users where  permission =2";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
        }
    }
    public static User findById(int id){
        String query = "select * from users where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}
