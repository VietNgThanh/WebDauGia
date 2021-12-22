package com.ute.webdaugia.beans;

import java.time.LocalDateTime;

public class Orders {
    private int idOrder,id_Product,id_User,rule,Price;
    private LocalDateTime Time_make_price,Time_to_close;

    public Orders() {
    }

    public Orders(int idOrder, int id_Product, int id_User, int rule, int price, LocalDateTime time_make_price, LocalDateTime time_to_close) {
        this.idOrder = idOrder;
        this.id_Product = id_Product;
        this.id_User = id_User;
        this.rule = rule;
        Price = price;
        Time_make_price = time_make_price;
        Time_to_close = time_to_close;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public int getId_Product() {
        return id_Product;
    }

    public int getId_User() {
        return id_User;
    }

    public int getRule() {
        return rule;
    }

    public int getPrice() {
        return Price;
    }

    public LocalDateTime getTime_make_price() {
        return Time_make_price;
    }

    public LocalDateTime getTime_to_close() {
        return Time_to_close;
    }
}
