package com.ute.webdaugia.beans;

public class ChildCategory {
    private int id, parent_id;
    private String name;

    public ChildCategory(String name, int parent_id) {
        this.id = -1;
        this.parent_id = parent_id;
        this.name = name;
    }

    public ChildCategory(int id, String name) {
        this.id = id;
        this.parent_id = -1;
        this.name = name;
    }

    public ChildCategory(int id, String name, int parent_id) {
        this.id = id;
        this.parent_id = parent_id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public int getParent_id() {
        return parent_id;
    }

    public String getName() {
        return name;
    }
}

