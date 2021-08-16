 
package com.daos;

import com.beans.Comment;
import com.db.DataConnection;
import java.sql.*;
import java.util.ArrayList;

public class CommentDao {
public boolean add(Comment comment){
    boolean status= false;
    try{
        Connection con = DataConnection.getConnection();
        String sql= "insert into comments (userName,description,bloggerId,blogId) values(?,?,?,?)";
        PreparedStatement smt = con.prepareStatement(sql);
        smt.setString(1, comment.getUserName());
        smt.setString(2, comment.getDescription());
        smt.setInt(3, comment.getBloggerId());
        smt.setInt(4, comment.getBlogId());
        if(smt.executeUpdate()>0)
            status=true;
        
        con.close();
        smt.close();
        
    }catch(Exception e){
        System.out.println("Error in writing comment : " + e.getMessage());
    }
    return status;
    
} 
 

public boolean addReply(int id,String text){
    boolean status= false;
     try{
         Connection con = DataConnection.getConnection();
         String sql= "update comments set reply=? where id=?";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setString(1, text);
         smt.setInt(2,id);
         if(smt.executeUpdate()>0)
             status=true;
         con.close();
         smt.close();
         
     }
     catch(Exception e){
         System.out.println("Reply Error : " + e.getMessage());
     }
    return status;
    
} 

public ArrayList<Comment> getAllCommentsByBlogId(int blogId){
    ArrayList<Comment> commentList=new ArrayList();
    try{
         Connection con = DataConnection.getConnection();
         String sql= "select * from comments where blogId=?  order by id desc ";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setInt(1,blogId);
        
         ResultSet rs= smt.executeQuery();
         while(rs.next()){
             Comment comment = new Comment();
             comment.setId(rs.getInt("id"));
             comment.setUserName(rs.getString("userName"));
             comment.setDescription(rs.getString("description"));
             comment.setBlogId(rs.getInt("blogId"));
             comment.setBloggerId(rs.getInt("bloggerId"));
             comment.setReply(rs.getString("reply"));
             
             commentList.add(comment);
         }
         con.close();
         smt.close();
         
     }
     catch(Exception e){
         System.out.println("Data Fetching  Error : " + e.getMessage());
     }
    return commentList;
}

public ArrayList<Comment> getAllCommentsByBloggerId(int bloggerId){
    ArrayList<Comment> commentList=new ArrayList();
    try{
         Connection con = DataConnection.getConnection();
         String sql= "select * from comments where bloggerId=?";
         PreparedStatement smt = con.prepareStatement(sql);
         smt.setInt(1,bloggerId);
        
         ResultSet rs= smt.executeQuery();
         while(rs.next()){
             Comment comment = new Comment();
             comment.setId(rs.getInt("id"));
             comment.setUserName(rs.getString("userName"));
             comment.setDescription(rs.getString("description"));
             comment.setBlogId(rs.getInt("blogId"));
             comment.setBloggerId(rs.getInt("bloggerId"));
             comment.setReply(rs.getString("reply"));
             
             commentList.add(comment);
         }
         con.close();
         smt.close();
         
     }
     catch(Exception e){
         System.out.println("Data Fetching  Error : " + e.getMessage());
     }
    return commentList;
}

public ArrayList<Comment> getAllComments(){
    ArrayList<Comment> commentList=new ArrayList();
    try{
         Connection con = DataConnection.getConnection();
         String sql= "select * from comments";
         PreparedStatement smt = con.prepareStatement(sql);
         ResultSet rs= smt.executeQuery();
         while(rs.next()){
             Comment comment = new Comment();
             comment.setId(rs.getInt("id"));
             comment.setUserName(rs.getString("userName"));
             comment.setDescription(rs.getString("description"));
             comment.setBlogId(rs.getInt("blogId"));
             comment.setBloggerId(rs.getInt("bloggerId"));
             comment.setReply(rs.getString("reply"));
             
             commentList.add(comment);
         }
         con.close();
         smt.close();
         
     }
     catch(Exception e){
         System.out.println("Data Fetching  Error : " + e.getMessage());
     }
    return commentList;
}
}
