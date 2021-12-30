package com.ute.webdaugia.beans;

public class TuChoiBidder {
    private int id_tu_choi;
    private int id_product,id_bidder;

    public TuChoiBidder() {
    }

    public TuChoiBidder(int id_product, int id_bidder) {
        this.id_product = id_product;
        this.id_bidder = id_bidder;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getId_bidder() {
        return id_bidder;
    }

    public void setId_bidder(int id_bidder) {
        this.id_bidder = id_bidder;
    }
}
