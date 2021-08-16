 
package com.daos;
import java.sql.*;
import java.util.ArrayList;
import com.beans.Blog;
import com.db.DataConnection;
public class BlogDao {
    public int getBlogCountByCategory(int catid){
        int count=0;
        try{
            Connection con = DataConnection.getConnection();
            String sql = "select count(id) from blogs where status='approved' and id in(select blogId from blogcategory where categoryId = ?);";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, catid);
            ResultSet rs = smt.executeQuery();
            if(rs.next())
                count = rs.getInt(1);
            rs.close();
            con.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in counting Blogs ...");
        }
        return count;
    }
    
    public boolean add(Blog blog, String categories[]){
        boolean status=false;
        Connection con = DataConnection.getConnection();
       
        try{
            con.setAutoCommit(false);
            String sql ="insert into blogs (title,description,date,bloggerId,poster)values(?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, blog.getTitle());
            smt.setString(2, blog.getDescription());
            smt.setString(3, blog.getDate());
            smt.setInt(4, blog.getBloggerId());
            smt.setString(5, blog.getPoster());
            System.out.println("1");
            if(smt.executeUpdate()>0){
                System.out.println("2");
                String sql1 = "select id from blogs order by id desc limit 1";
                PreparedStatement smt1 = con.prepareStatement(sql1);
                ResultSet rs = smt1.executeQuery();
                int bloggerId =0;
                if(rs.next()){
                    System.out.println("3");
                    bloggerId = rs.getInt("id");
                    
                    for(String cid : categories){
                        System.out.println("4");
                        String sql2 = "Insert into blogCategory (blogId,categoryId) values(?,?)";
                        PreparedStatement smt2 = con.prepareStatement(sql2);
                       smt2.setInt(1, bloggerId);
                       smt2.setInt(2, Integer.parseInt(cid));
                        smt2.executeUpdate();
                    }
                }
            }
            con.commit();
            con.close();
            smt.close();
            status=true;
        }catch(Exception e){
            System.out.println("Blog insertion error : " + e.getMessage());
            try{con.rollback();}catch(Exception ex){}
        }
        
        return status;
    }
    
    
    public boolean update(Blog blog, String categories[]){
        boolean status=false;
        Connection con = DataConnection.getConnection();
       
        try{
            con.setAutoCommit(false);
            System.out.println("title inside dao : "+ blog.getTitle());
            String sql ="update blogs set title=?,description=?,date=?,bloggerId=?,poster=? where id=? ";           PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, blog.getTitle());
            smt.setString(2, blog.getDescription());
            smt.setString(3, blog.getDate());
            smt.setInt(4, blog.getBloggerId());
            smt.setString(5, blog.getPoster());
            smt.setInt(6, blog.getId());
            System.out.println("1");
            if(smt.executeUpdate()>0){
                String sql1 = "delete from blogCategory where blogId=?";
                PreparedStatement smt1 = con.prepareStatement(sql1);
                smt1.setInt(1, blog.getId());
                if(smt1.executeUpdate()>0){
                     int blogId =blog.getId();
                
                    for(String cid : categories){
                        System.out.println("4");
                        String sql2 = "Insert into blogCategory (blogId,categoryId) values(?,?)";
                        PreparedStatement smt2 = con.prepareStatement(sql2);
                        smt2.setInt(1, blogId);
                        smt2.setInt(2, Integer.parseInt(cid));
                        smt2.executeUpdate();
                    }
                 
                }
               
            }
            con.commit();
            con.close();
            smt.close();
            status=true;
        }catch(Exception e){
            System.out.println("Blog Updation error : " + e.getMessage());
            try{con.rollback();}catch(Exception ex){}
        }
        
        return status;
    }
    
    
    
    public ArrayList<Blog> getAllBlogs(){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
    
     public ArrayList<Blog> getAllBlogsByBlogger(int bloggerId){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs where bloggerId=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, bloggerId);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
    
    
    public ArrayList<Blog> getBlogsByStatus(String status){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs where status=? order by id desc";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
    
    public ArrayList<Blog> getBlogsByStatus(String status,int start, int stop){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs where status=? order by id desc limit ?, ?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            smt.setInt(2,start);
            smt.setInt(3,stop);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
    
     public ArrayList<Blog> getBlogsByCategory(int cid){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs where id in (select blogId from blogCategory where categoryId = ?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, cid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
     
     public ArrayList<Blog> getBlogsByCategory(int cid,String status){
        ArrayList<Blog> blist = new ArrayList();
        try{
            Connection con = DataConnection.getConnection();
            String sql="select * from blogs where status=? and id in (select blogId from blogCategory where categoryId = ?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1,status);
            smt.setInt(2, cid);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                
                blist.add(blog);
            }
            con.close();
            rs.close();
            smt.close();
        }catch(Exception e){
            System.out.println("Error in fetching blog details " + e.getMessage());
        }
        return blist;
    }
     
     public boolean changeStatus (int id,String text){
         boolean status = false;
         try{
             String sql = "update blogs set status=? where id=?";
             Connection con = DataConnection.getConnection();
             PreparedStatement smt = con.prepareStatement(sql);
             smt.setString(1, text);
             smt.setInt(2, id);
             if(smt.executeUpdate()>0)
                 status=true;
             con.close();
             smt.close();
         }catch(Exception e){
             System.out.println("Status update error  : " +e.getMessage());
         }
         return status;
         
     }
     
     public Blog getBlogDetailById(int bid){
         Blog blog=null;
         try{
             Connection con = DataConnection.getConnection();
             String sql  = "select * from blogs where id=?";
             PreparedStatement smt = con.prepareStatement(sql);
             smt.setInt(1, bid);
             ResultSet rs= smt.executeQuery();
             if(rs.next()){
                 blog = new Blog();
                 blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDescription(rs.getString("description"));
                blog.setBloggerId(rs.getInt("bloggerId"));
                blog.setDate(rs.getString("date"));
                blog.setPoster(rs.getString("poster"));
                blog.setStatus(rs.getString("status"));
                 
             }
         }catch(Exception e){
             System.out.println("Error in fetching blog by id : " + e.getMessage());
         }
         return blog;
     }
     
    public int getBlogCount(String status){
        int count=0;
        try{
            Connection con = DataConnection.getConnection();
            String sql ="select count(*) from blogs where status=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                count=rs.getInt(1);
            }
            con.close();
            smt.close();
            rs.close();
        }catch(Exception e){
            System.out.println("Error in counting blogs : " + e.getMessage());
        }
    return count;
    } 
    
}
