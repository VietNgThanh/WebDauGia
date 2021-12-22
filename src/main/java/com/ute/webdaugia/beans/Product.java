package com.ute.webdaugia.beans;

public class Product {
    private  int idProduct,id_Cat,User_id,Availability,Start_price,id_ParentCat,Imme_Price,Current_Price;
    private String Name,Detail_tiny,Detail_full;

    public Product() {
    }

    public Product(int idProduct, int id_Cat, int user_id, int availability, int start_price, int id_ParentCat, int imme_Price, int current_Price, String name, String detail_tiny, String detail_full) {
        this.idProduct = idProduct;
        this.id_Cat = id_Cat;
        User_id = user_id;
        Availability = availability;
        Start_price = start_price;
        this.id_ParentCat = id_ParentCat;
        Imme_Price = imme_Price;
        Current_Price = current_Price;
        Name = name;
        Detail_tiny = detail_tiny;
        Detail_full = detail_full;
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

    public int getImme_Price() {
        return Imme_Price;
    }

    public int getId_ParentCat() {
        return id_ParentCat;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }
}
