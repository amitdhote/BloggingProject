package com.controllers;

import com.beans.Blogger;
import com.daos.BloggerDao;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BloggerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    response.setContentType("text/html");
    String op = request.getParameter("op");
    if(op!=null && op.equals("checkuserid")){
        String userid= request.getParameter("userid");
        BloggerDao bd = new BloggerDao();
        if(bd.isUseridExist(userid))
            out.println("<font color='red'><b>Sorry! this userid is already registered !!</b></font>");
        else
            out.println("<font color='blue'><b>Congrates! this userid is available !!</b></font>");
 
    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/htmlm");
        String op = request.getParameter("op");
        if(op!=null && op.equals("add")){
            String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "media");
            if(imgPath!=null){
                HttpSession session = request.getSession();
                BloggerDao bd = new BloggerDao();
                Blogger blogger = (Blogger)session.getAttribute("blogger");
                blogger.setPic(imgPath);
                String catIds[] = (String[]) session.getAttribute("categories");
                session.removeAttribute("blogger");
                session.removeAttribute("categories");
                
                if(bd.add(blogger, catIds))
                    response.sendRedirect("blogin.jsp");
                else
                    out.println("<font color='red'>Not registered</font>");
            }
        }
        if(op!=null && op.equalsIgnoreCase("login")){
            String userid=request.getParameter("userid");
            String password =request.getParameter("password");
            BloggerDao bd = new BloggerDao();
            Blogger blogger = bd.getByLoginDetails(userid, password);
            if(blogger!=null){
                if(blogger.getStatus().equalsIgnoreCase("approved")){
                   HttpSession session = request.getSession();
                   session.setAttribute("blogger", blogger);
                   //adding cookie if blogger wants
                   String remember = request.getParameter("remember");
                   if(remember!=null) {
                   Cookie c = new Cookie("bloggerUserid", userid);
                   Cookie c1 = new Cookie("bloggerPassword",password);
                   c.setMaxAge(60*60*24*7);
                   c1.setMaxAge(60*60*27*7);
                   response.addCookie(c);
                   response.addCookie(c1);
                   }
                    response.sendRedirect("blogger/dashboard.jsp");
                }
                else
                    response.sendRedirect("blogin.jsp?errorMessage=Account is pending for Approval");

            }
            else {
                response.sendRedirect("blogin.jsp?errorMessage=Invalid Userid or Password");
            }
        }
       if(op!=null && op.equalsIgnoreCase("changeStatus")){
           int id= Integer.parseInt(request.getParameter("id"));
           String status = request.getParameter("status");
           if(new BloggerDao().changeStatus(id, status))
               response.sendRedirect(request.getHeader("referer"));
           else
               out.println("Status cannot be changed ....");
       } 
    }

   
}
