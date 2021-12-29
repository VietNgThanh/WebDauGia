package com.ute.webdaugia.beans;

public class Danh_Gia_NguoiDung {
    private int id;
    private  int id_nguoidanhgia;
    private int id_nguoi_duoc_danhgia;
    private String comment;
    private int trangthai;

    public Danh_Gia_NguoiDung() {
    }

//    public Danh_Gia_NguoiDung(int id_nguoidanhgia, int id_nguoi_duoc_danhgia, String comment, int trangthai, String name) {
//        this.id_nguoidanhgia = id_nguoidanhgia;
//        this.id_nguoi_duoc_danhgia = id_nguoi_duoc_danhgia;
//        this.comment = comment;
//        this.trangthai = trangthai;
//        this.name = name;
//    }

    public Danh_Gia_NguoiDung(int id_nguoidanhgia, int id_nguoi_duoc_danhgia, String comment, int trangthai) {
        this.id_nguoidanhgia = id_nguoidanhgia;
        this.id_nguoi_duoc_danhgia = id_nguoi_duoc_danhgia;
        this.comment = comment;
        this.trangthai = trangthai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_nguoidanhgia() {
        return id_nguoidanhgia;
    }

    public void setId_nguoidanhgia(int id_nguoidanhgia) {
        this.id_nguoidanhgia = id_nguoidanhgia;
    }

    public int getId_nguoi_duoc_danhgia() {
        return id_nguoi_duoc_danhgia;
    }

    public void setId_nguoi_duoc_danhgia(int id_nguoi_duoc_danhgia) {
        this.id_nguoi_duoc_danhgia = id_nguoi_duoc_danhgia;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }
}
