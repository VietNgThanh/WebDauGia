package com.ute.webdaugia.beans;

public class Product {
    private  int idProduct,id_Cat,User_id,Availability,Start_price;
    private String Name,Detail_tiny,Detail_full;
    private double Imme_Price,Current_Price;

    public Product() {
    }

    public Product(int idProduct, String name, int id_Cat, int userid, String detail_tiny, String detail_full, int start_price, double imme_Price, int availability, double current_Price) {
        this.idProduct = idProduct;
        this.id_Cat = id_Cat;
        User_id = userid;
        Availability = availability;
        Name = name;
        Detail_tiny = detail_tiny;
        Detail_full = detail_full;
        Start_price = start_price;
        Imme_Price = imme_Price;
        Current_Price = current_Price;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getIdCat() {
        return id_Cat;
    }

    public int getUserid() {
        return User_id;
    }

    public int getAvailability() {
        return Availability;
    }

    public String getName() {
        return Name;
    }

    public String getDetail_tiny() {
        return Detail_tiny;
    }

    public String getDetail_full() {
        return Detail_full;
    }

    public int getStart_price() {
        return Start_price;
    }

    public double getImme_Price() {
        return Imme_Price;
    }

    public double getCurrent_Price() {
        return Current_Price;
    }
}
