package com.ute.webdaugia.beans;

import java.time.LocalDateTime;

public class Product {
    private  int idProduct,id_Cat,User_id,Availability,Start_price,id_ParentCat,Imme_Price,Current_Price,id_Bidder_current,highest_price,buoc_nhay,dathongbao;
    private String Name,Detail_tiny,Detail_full;
    private LocalDateTime Time_to_close;
    public Product() {
    }

    public LocalDateTime getTime_to_close() {
        return Time_to_close;
    }

    public Product(int idProduct, int id_Cat, int user_id, int availability, int start_price, int id_ParentCat, int imme_Price, int current_Price, int id_Bidder_current, int highest_price, int buoc_nhay, int dathongbao, String name, String detail_tiny, String detail_full) {
        this.idProduct = idProduct;
        this.id_Cat = id_Cat;
        User_id = user_id;
        Availability = availability;
        Start_price = start_price;
        this.id_ParentCat = id_ParentCat;
        Imme_Price = imme_Price;
        Current_Price = current_Price;
        this.id_Bidder_current = id_Bidder_current;
        this.highest_price = highest_price;
        this.buoc_nhay = buoc_nhay;
        this.dathongbao = dathongbao;
        Name = name;
        Detail_tiny = detail_tiny;
        Detail_full = detail_full;
    }

    public Product(int id_Cat, int start_price, int imme_Price, int buoc_nhay, String name, String detail_tiny, String detail_full,int user_id) {
        this.id_Cat = id_Cat;
        Start_price = start_price;
        Imme_Price = imme_Price;
        this.buoc_nhay = buoc_nhay;
        Name = name;
        Detail_tiny = detail_tiny;
        Detail_full = detail_full;
        User_id=user_id;
    }

    public int getBuoc_nhay() {
        return buoc_nhay;
    }

    public int getDathongbao() {
        return dathongbao;
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

    public int getId_Bidder_current() {
        return id_Bidder_current;
    }

    public int getHighest_price() {
        return highest_price;
    }
}
