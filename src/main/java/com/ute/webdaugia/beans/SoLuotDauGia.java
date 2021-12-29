package com.ute.webdaugia.beans;

public class SoLuotDauGia {
    private int idProduct;
    private int soluotragia;

    public SoLuotDauGia() {
    }

    public SoLuotDauGia(int idProduct, int soluotragia) {
        this.idProduct = idProduct;
        this.soluotragia = soluotragia;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getSoluotragia() {
        return soluotragia;
    }

    public void setSoluotragia(int soluotragia) {
        this.soluotragia = soluotragia;
    }
}
