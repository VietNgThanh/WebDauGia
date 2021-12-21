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

    public static ChildCategory findById(int childId) {
        final String query = "SELECT * FROM childcategory WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<ChildCategory> list = con.createQuery(query)
                .addParameter("id", childId)
                .executeAndFetch(ChildCategory.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void update(ChildCategory c) {
        String sql = "UPDATE childcategory SET  name = :name WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                .addParameter("id", c.getId())
                .addParameter("name", c.getName())
                .executeUpdate();
        }
    }

    public static void delete(int id) {
        String sql = "DELETE FROM childcategory WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(sql)
                .addParameter("id", id)
                .executeUpdate();
        }
    }

    public static List<ChildCategory> findByParentId(int parentId) {
        final String query = "SELECT * FROM childcategory WHERE parent_id = :parent_id";
        try (Connection con = DbUtils.getConnection()) {
            List<ChildCategory> list = con.createQuery(query)
                .addParameter("parent_id", parentId)
                .executeAndFetch(ChildCategory.class);

            return list;
        }
    }
}