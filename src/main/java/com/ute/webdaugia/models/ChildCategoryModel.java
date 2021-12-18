package com.ute.webdaugia.models;

import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ChildCategoryModel {

    public static List<ChildCategory> findAll() {
        final String query = "SELECT * FROM childcategory";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                .executeAndFetch(ChildCategory.class);
        }
    }

    public static void add(ChildCategory child) {
        String insertSql = "INSERT INTO childcategory (name, parent_id) VALUES (:name,:parent_id)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(insertSql)
                .addParameter("name", child.getName())
                .addParameter("parent_id", child.getParent_id())
                .executeUpdate();
        }
    }
}