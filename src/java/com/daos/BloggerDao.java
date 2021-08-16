 
package com.daos;
import com.beans.Blogger;
import com.beans.Category;
import java.sql.*;
import java.util.ArrayList;
import com.db.DataConnection;
 
public class BloggerDao {
    public boolean add(Blogger blogger, String catIds[]){
        boolean status=false;
        Connection con=null;
        try{
            con = DataConnection.getConnection();
            con.setAutoCommit(false);
            String sql1 = "insert into blogger (name,userid,password,gender,contact,pic) values(?,?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql1);
            smt.setString(1, blogger.getName());
            smt.setString(2, blogger.getUserid());
            smt.setString(3, blogger.getPassword());
            smt.setString(4, blogger.getGender());
            smt.setString(5, blogger.getContact());
            smt.setString(6, blogger.getPic());
            
            if(smt.executeUpdate()>0){
                //faetch the recent blogger's Id  who has registered above
                String sql2= "select id from blogger order by id desc limit 1";
                PreparedStatement smt2 = con.prepareStatement(sql2);
                ResultSet rs = smt2.executeQuery();
                int bloggerId=0;
                if(rs.next())
                    bloggerId = rs.getInt("id");
            
            //insert the relation of blogger and category inside bloggercategory table
            for(String catId : catIds){
                String sql3 = "insert into bloggercategory(bloggerId,categoryId) values(?,?)";
                PreparedStatement smt3= con.prepareStatement(sql3);
                smt3.setInt(1,bloggerId);
                smt3.setInt(2,Integer.parseInt(catId));
                smt3.executeUpdate();
            }
            
            }
        con.commit();
        status=true;
       // smt.close();
        con.close();
        }catch(Exception e){
            System.out.println("Error in Insertion ..." + e.getMessage());
           try{ con.rollback(); } catch(Exception ex){}
        }
        return status;
    }
    
    
    
    public Blogger getByLoginDetails(String userid,String password){
        Blogger blogger = null;
        try{
            Connection con= DataConnection.getConnection();
            String sql ="select * from blogger where userid=? and password=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            smt.setString(2, password);
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                blogger = new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setGender(rs.getString("gender"));
                blogger.setContact(rs.getString("contact"));
                blogger.setStatus(rs.getString("status"));
                blogger.setPic(rs.getString("pic"));
            }
        con.close();
        smt.close();
        rs.close();
        }catch(Exception e){
            System.out.println("Error in fetching login details ...." +e.getMessage());
        }
        return blogger;
    }
    
    public Blogger getById(int id){
         Blogger blogger = null;
        try{
            Connection con= DataConnection.getConnection(); 
            String sql ="select * from blogger where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                blogger = new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setGender(rs.getString("gender"));
                blogger.setContact(rs.getString("contact"));
                blogger.setStatus(rs.getString("status"));
                blogger.setPic(rs.getString("pic"));
            }
        con.close();
        smt.close();
        rs.close();
        }catch(Exception e){
            System.out.println("Error in fetching record by id ... " + e.getMessage());
       }
        return blogger;
    }
    
    public ArrayList<Blogger> getAllBloggers(){
       ArrayList bloggerList = new ArrayList();
       Blogger blogger = null;
        try{
            Connection con= DataConnection.getConnection();
            String sql ="select * from blogger";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                blogger = new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setGender(rs.getString("gender"));
                blogger.setContact(rs.getString("contact"));
                blogger.setStatus(rs.getString("status"));
                blogger.setPic(rs.getString("pic"));
                bloggerList.add(blogger);
            }
        con.close();
        smt.close();
        rs.close();
        }catch(Exception e){
            System.out.println("Error to fetch all records " + e.getMessage());
        }
        return bloggerList;
    }
    
    public boolean changeStatus(int id,String statusValue){
        boolean status=false;
        try{
            Connection con = DataConnection.getConnection();
           
            String sql1 = "update blogger set status =? where id=?";
            PreparedStatement smt = con.prepareStatement(sql1);
            smt.setString(1, statusValue);
            smt.setInt(2,id);
            if (smt.executeUpdate()>0)
                status=true;
            con.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error : " + e.getMessage());
        }
        return status;
    }
    
    public ArrayList<Blogger> getBloggersByStatus(String status){
       ArrayList bloggerList = new ArrayList();
       Blogger blogger = null;
        try{
            Connection con= DataConnection.getConnection();
            String sql ="select * from blogger where status=?";
           PreparedStatement smt = con.prepareStatement(sql);
           smt.setString(1, status);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                blogger = new Blogger();
                blogger.setId(rs.getInt("id"));
                blogger.setName(rs.getString("name"));
                blogger.setUserid(rs.getString("userid"));
                blogger.setPassword(rs.getString("password"));
                blogger.setGender(rs.getString("gender"));
                blogger.setContact(rs.getString("contact"));
                blogger.setStatus(rs.getString("status"));
                blogger.setPic(rs.getString("pic"));
                bloggerList.add(blogger);
            }
        con.close();
        smt.close();
        rs.close();
        }catch(Exception e){
            System.out.println("Error to fetch all records " + e.getMessage());
        }
        return bloggerList;
    }
    
    public boolean isUseridExist(String userid){
        boolean status = false;
        try{
            String sql = "select * from blogger where userid=?";
            Connection con = DataConnection.getConnection();
            PreparedStatement smt= con.prepareStatement(sql);
            smt.setString(1,userid);
            ResultSet rs=smt.executeQuery();
            if(rs.next())
                status=true;
            rs.close();
            smt.close();
            con.close();
        }catch(Exception e){
                System.out.println("userid check error .." + e.getMessage());
        }
        return status;
    }
    public ArrayList<Category> getBloggerCategories(int bid){
        ArrayList<Category> clist=new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql = "select * from categories where id in (select categoryId from bloggercategory where bloggerId=?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1,bid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                
                clist.add(category);
            }
            rs.close();
            smt.close();
            con.close();
        }catch(Exception e){
            System.out.println("Error in fetching categories ..." + e.getMessage());
        }
        
        return clist;
    }
    
}


