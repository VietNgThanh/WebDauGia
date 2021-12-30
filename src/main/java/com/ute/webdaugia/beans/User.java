package com.ute.webdaugia.beans;

public class User {
    private int idUser,Mark;
    private String username,name, password, email,address;
    private int permission;
    private String code;
    public User() {
    }

    public User(int idUser, String username, String password, String name,  String email, String address, int permission, int mark) {
        this.idUser = idUser;
        Mark = mark;
        this.username = username;
        this.name = name;
        this.password = password;
        this.email = email;
        this.address = address;
        this.permission = permission;
    }

//    public User(int idUser, String username, String password, String name, String email, String address, int permission, String code) {
//        this.idUser = idUser;
//        this.username = username;
//        this.password = password;
//        this.name = name;
//        this.email = email;
//        this.address = address;
//        this.permission = permission;
//        this.code = code;
//    }

    public int getMark() {
        return Mark;
    }

    public void setMark(int mark) {
        Mark = mark;
    }

    public User(int idUser, String username, String password, String name, String email, String address, int permission) {
        this.idUser = idUser;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.permission = permission;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isAdmin() {
        return this.permission == 3;
    }

    public boolean isSeller() {
        return this.permission == 2;
    }
}

