package com.shou.tijianserver.entity;

public class Hospital {
    private int id;
    private String name;
    private String businesshours;
    private String deadline;
    private String telephone;
    private String address;
    private String picture;

    // Constructors, getters, and setters
    public Hospital(int id, String name, String businesshours, String deadline, String telephone, String address, String picture) {
        this.id = id;
        this.name = name;
        this.businesshours = businesshours;
        this.deadline = deadline;
        this.telephone = telephone;
        this.address = address;
        this.picture = picture;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getBusinesshours() { return businesshours; }
    public void setBusinesshours(String businesshours) { this.businesshours = businesshours; }
    public String getDeadline() { return deadline; }
    public void setDeadline(String deadline) { this.deadline = deadline; }
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getPicture() { return picture; }
    public void setPicture(String picture) { this.picture = picture; }
}
