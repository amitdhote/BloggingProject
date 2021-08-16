/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import java.sql.*;
import java.util.ArrayList;
import com.beans.Category;
import com.db.DataConnection;
public class CategoryDao {
    public boolean add(Category category){
        boolean status = false;
        try{
            Connection con  = DataConnection.getConnection();
            String sql = "insert into categories (name,description) values(?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, category.getName());
            smt.setString(2, category.getDescription());
            if(smt.executeUpdate()>0)
                status=true;
            con.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in adding category :" + e.getMessage());
        }
        return status;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> categoryList = new ArrayList();
        try{
            String sql = "select * from categories";
            Connection con = DataConnection.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                
                categoryList.add(c);
            }
        }catch(Exception e){
            System.out.println("Error in fetching all categories ..." + e.getMessage());
        }
        return categoryList;
    }
    public ArrayList<Category> getCategoryiesByBloggerId(int id){
        ArrayList<Category> categoryList = new ArrayList();
        try{
            String sql = "select * from categories where id in (select categoryId  from bloggerCategory  where bloggerID=?)";
            Connection con = DataConnection.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                
                categoryList.add(c);
            }
        }catch(Exception e){
            System.out.println("Error in fetching all categories ..." + e.getMessage());
        }
        return categoryList;
    }
    
    public ArrayList<Category> getCategoryiesByBlogId(int id){
        ArrayList<Category> categoryList = new ArrayList();
        try{
            String sql = "select * from categories where id in (select categoryid from blogcategory where blogId=?);";
            Connection con = DataConnection.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                
                categoryList.add(c);
            }
        }catch(Exception e){
            System.out.println("Error in fetching all categories ..." + e.getMessage());
        }
        return categoryList;
    } 
    
}
