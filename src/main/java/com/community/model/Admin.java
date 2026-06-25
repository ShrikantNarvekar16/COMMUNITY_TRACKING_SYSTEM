package com.community.model;

public class Admin extends User {
    private String department; // Example: "Sanitation", "Security", "General"

    public Admin() {
        super();
        this.setRole("ADMIN"); // Ensure every Admin object defaults to the ADMIN role
    }

    // Overloaded constructor to quickly create an Admin
    public Admin(int id, String name, String email, String password, String department) {
        super(id, name, email, password, "ADMIN");
        this.department = department;
    }

    // Getter and Setter for admin-specific fields
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}