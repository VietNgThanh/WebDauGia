package com.ute.webdaugia.beans;

public class ParentCategory {
    private int id;
    private String name;

    public ParentCategory(String name) {
        this.id = -1;
        this.name = name;
    }

    public ParentCategory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
