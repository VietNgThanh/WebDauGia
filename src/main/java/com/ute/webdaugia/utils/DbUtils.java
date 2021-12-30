package com.ute.webdaugia.utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class DbUtils {
  static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webdaugia", "root", "");
//  static Sql2o sql2o = new Sql2o("jdbc:mysql://34.87.166.56:3306/webdaugia", "root", "ute");

  public static Connection getConnection() {
    return sql2o.open();
  }
}
