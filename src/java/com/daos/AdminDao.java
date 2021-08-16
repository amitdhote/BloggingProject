/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;
import com.beans.Admin;
import java.sql.*;
import com.db.DataConnection;

public class AdminDao {
 public Admin getByLoginDetails(String userid, String password){
     Admin admin =null;
     try{
         Connection con = DataConnection.getConnection();
         String sql = "select * from admin where userid=? and password=?";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setString(1, userid);
         smt.setString(2, password);
         ResultSet rs = smt.executeQuery();
         if(rs.next()){
             admin = new Admin();
             admin.setId(rs.getInt("id"));
             admin.setName(rs.getString("name"));
             admin.setUserid(rs.getString("userid"));
             admin.setPassword(rs.getString("password"));
             admin.setPic(rs.getString("pic"));
         }
         con.close();
         smt.close();
         rs.close();
     }catch(Exception e){
         System.out.println("error : " + e.getMessage());
     }
     
     return admin;
 }
 
public boolean updateProfilePic(int id,String imagePath){
    boolean status=false;
      try{
         Connection con = DataConnection.getConnection();
         String sql = "update admin set pic=? where id=?";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setString(1,imagePath);
         smt.setInt(2, id);
         if(smt.executeUpdate()>0)
             status=true;
         con.close();
         smt.close();
         }catch(Exception e){
         System.out.println("error : " + e.getMessage());
     }
    return status;
} 

public boolean updatePassword(int id,String newPassword){
    boolean status=false;
      try{
         Connection con = DataConnection.getConnection();
         String sql = "update admin set password=? where id=?";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setString(1,newPassword);
         smt.setInt(2, id);
         if(smt.executeUpdate()>0)
             status=true;
         con.close();
         smt.close();
         }catch(Exception e){
         System.out.println("error : " + e.getMessage());
     }
    return status;
} 

}
