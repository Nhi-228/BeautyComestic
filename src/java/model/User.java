package model;

public class User {
    private int user_id;
    private String username;
    private String email;
    private String password;
    private String full_name;
    private String phone;
    private String address;
    private String role;
    private String created_at;
    private String updated_at;
    private boolean verified;
    private boolean blocked;
    private boolean is_active;

    public User() {
    }

    public User(int user_id, String username, String email, String password, String full_name,
                String phone, String address, String role, String created_at,
                String updated_at, boolean verified, boolean blocked, boolean is_active) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.verified = verified;
        this.blocked = blocked;
        this.is_active = is_active;
    }

    // Getters và Setters
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public boolean isActive() {
        return is_active;
    }

    public void setActive(boolean is_active) {
        this.is_active = is_active;
    }
}