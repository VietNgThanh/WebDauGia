package com.ute.webdaugia.beans;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.Calendar;

public class Orders {
    private int idOrder,id_Product,id_User,Price,current_price;
    private LocalDateTime Time_make_price;
//    private Time a;
    public Orders() {
    }

    public Orders(int id_Product, int id_User, int price) {
        this.id_Product = id_Product;
        this.id_User = id_User;
        this.Price = price;
//        this.rule = rule;
    }

    public Orders(int idOrder, int id_Product, int id_User, int price, LocalDateTime time_make_price,int current_price) {
        this.idOrder = idOrder;
        this.id_Product = id_Product;
        this.id_User = id_User;
//        this.rule = rule;
        Price = price;
        Time_make_price = time_make_price;
        current_price=current_price;
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

//    public int getRule() {
//        return rule;
//    }

    public int getPrice() {
        return Price;
    }

    public LocalDateTime getTime_make_price() {
        return Time_make_price;
    }

    public int getCurrent_price() {
        return current_price;
    }

    public void setCurrent_price(int current_price) {
        this.current_price = current_price;
    }
}
