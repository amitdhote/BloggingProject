package com.daos;

import java.util.ArrayList;
import com.beans.User;
import com.db.DataConnection;
import java.sql.*;

public class UserDao {

    public boolean add(User user) {
        boolean status = false;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "insert into users (name,age,userid,password,gender,hobbies,pic)values(?,?,?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, user.getName());
            smt.setInt(2, user.getAge());
            smt.setString(3, user.getUserid());
            smt.setString(4, user.getPassword());
            smt.setString(5, user.getGender());
            smt.setString(6, user.getHobbies());
            smt.setString(7, user.getPic());
            int i = smt.executeUpdate();
            con.close();
            smt.close();
            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
        }
        return status;
    }

    public boolean update(User user) {
        boolean status = false;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "update users set name=?, age=?, gender=?, hobbies=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, user.getName());
            smt.setInt(2, user.getAge());
            smt.setString(3, user.getGender());
            smt.setString(4, user.getHobbies());
            smt.setInt(5, user.getId());
            int i = smt.executeUpdate();
            con.close();
            smt.close();
            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
        }

        return status;
    }

    public boolean delete(int id) {
        boolean status = false;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "delete from users where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            int i = smt.executeUpdate();
            con.close();
            smt.close();
            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
        }

        return status;
    }

    public boolean changePassword(int id, String newPassword) {
        boolean status = false;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "update users set password=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, newPassword);
            smt.setInt(2, id);
            int i = smt.executeUpdate();
            con.close();
            smt.close();
            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
        }

        return status;
    }

    public boolean changeProfilePic(int id, String newFileName) {
        boolean status = false;

        try {
            Connection con = DataConnection.getConnection();
            String sql = "update users set pic=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, newFileName);
            smt.setInt(2, id);
            int i = smt.executeUpdate();
            con.close();
            smt.close();
            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("error : " + e.getMessage());
        }

        return status;
    }

    public User getById(int id) {
        User user = null;

        try {
            Connection con = DataConnection.getConnection();
            String sql = "select * from users where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs = smt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setAge(rs.getInt("age"));
                user.setPic(rs.getString("pic"));
            }
            con.close();
            smt.close();
            rs.close();
        } catch (Exception e) {
            System.out.println("Error  " + e.getMessage());
        }
        return user;
    }

    public User getByLoginDetails(String userid, String password) {
        User user = null;
        try {
            Connection con = DataConnection.getConnection();
            String sql = "select * from users where userid=? and password=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            smt.setString(2, password);
            ResultSet rs = smt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setAge(rs.getInt("age"));
                user.setPic(rs.getString("pic"));
            }
            con.close();
            smt.close();
            rs.close();
        } catch (Exception e) {
            System.out.println("Error  " + e.getMessage());
        }
        return user;
    }

    public ArrayList<User> getAllRecords() {
        ArrayList<User> userlist = new ArrayList();
        try {
            Connection con = DataConnection.getConnection();
            String sql = "select * from users";
            PreparedStatement smt = con.prepareStatement(sql);
           
            ResultSet rs = smt.executeQuery();
           while (rs.next()) {
               User user = new User();
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setAge(rs.getInt("age"));
                user.setPic(rs.getString("pic"));
                userlist.add(user);
            }
            con.close();
            smt.close();
            rs.close();
        } catch (Exception e) {
            System.out.println("Error  " + e.getMessage());
        }
        return userlist;
    }

    public int getTotalRecord(){
        int total=0;
        try{
            Connection con = DataConnection.getConnection();
            String sql="select count(*) from users";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                total = rs.getInt(1);
            }
            con.close();
            rs.close();
            smt.close();
        } catch(Exception e){
            System.out.println("Error : " + e.getMessage());
        }
        return total;
    }
}
