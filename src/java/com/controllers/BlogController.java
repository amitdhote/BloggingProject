 
package com.controllers;

import com.beans.Blog;
import com.beans.Blogger;
import com.daos.BlogDao;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class BlogController extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
         response.setContentType("text/html");
         String op= request.getParameter("op");
         if(op!=null && op.equalsIgnoreCase("add")){
             String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "media/blogs");
             if(imgPath!=null){
                 HttpSession session= request.getSession();
                 Blog blog = (Blog)session.getAttribute("blog");
                 blog.setPoster(imgPath);
                 String categories[] =(String[])session.getAttribute("categories");
                 if(new BlogDao().add(blog, categories))
                     response.sendRedirect("blogger/dashboard.jsp");
                 else
                     out.println("Blog cannot be added ...");
             }    
             }
         
         if(op!=null && op.equalsIgnoreCase("changeStatus")){
             BlogDao bd = new BlogDao();
             int id= Integer.parseInt(request.getParameter("id"));
             String status = request.getParameter("status");
             if(bd.changeStatus(id, status))
                 response.sendRedirect(request.getHeader("referer"));
             else
                 out.println("<font color='red'>Status cannot be updated </font>");
         }
         
          if(op!=null && op.equalsIgnoreCase("update")){
              HttpSession session = request.getSession();
              String categories[] = (String[])session.getAttribute("categories");
              Blog blog = (Blog) session.getAttribute("blog");
              System.out.println("Title again : "+ blog.getTitle());
              String newPath = ImageUtility.uploadImage(request, getServletConfig(), "media/blogs");
              System.out.println("Start...");
              if(newPath!=null) 
                blog.setPoster(newPath);
             BlogDao bd = new BlogDao();
              System.out.println("Updation start....");
             if(bd.update(blog,categories)){
                 System.out.println("Updation completed....");
                //response.sendRedirect(request.getHeader("referer"));
                out.println("success...");
                session.removeAttribute("blog");
                session.removeAttribute("categories");
             }
             else
                 out.println("<font color='red'> Error in updation</font>");
          }
         }
    }

    