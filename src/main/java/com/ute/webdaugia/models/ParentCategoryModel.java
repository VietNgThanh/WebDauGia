package com.ute.webdaugia.models;

import com.ute.webdaugia.beans.ParentCategory;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ParentCategoryModel {

    public static List<ParentCategory> findAll() {
        final String query = "select * from parentcategory";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                .executeAndFetch(ParentCategory.class);
        }
    }

    public static void add(ParentCategory c) {
        final String query = "INSERT INTO parentcategory (Name) VALUES (:name)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                .addParameter("name", c.getName())
                .executeUpdate();
        }
    }

    public static ParentCategory findByName(String name) {
        final String query = "select * from parentcategory where name = :name";
        List<ParentCategory> result = null;
        try (Connection con = DbUtils.getConnection()) {
            result = con.createQuery(query)
                .addParameter("name", name)
                .executeAndFetch(ParentCategory.class);
        }
        if (result.size() == 0) {
            return null;
        }
        return result.get(0);
    }

    public static ParentCategory findById(int id) {

        final String query = "select * from parentcategory where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<ParentCategory> list = con.createQuery(query)
                .addParameter("id", id)
                .executeAndFetch(ParentCategory.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}