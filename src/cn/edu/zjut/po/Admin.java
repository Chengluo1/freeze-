package cn.edu.zjut.po;

public class Admin {
    String adminId;
    String name;
    String phone;
    String password;
    String profilePhoto;

    public Admin() {
    }

    public Admin(String adminId) {
        this.setAdminId(adminId);
    }

    public Admin(String adminId, String name, String phone, String password, String profilePhoto) {
        this.adminId = adminId;
        this.password = password;
        this.phone = phone;
        this.name = name;
        this.profilePhoto = profilePhoto;
    }

    public String getAdminId() {
        return this.adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfilePhoto() {
        return this.profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
}
