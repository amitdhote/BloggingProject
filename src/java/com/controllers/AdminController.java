 
package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.beans.Admin;
import com.daos.AdminDao;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
/**
 *
 * @author DELL
 */
public class AdminController extends HttpServlet {

    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op=request.getParameter("op");
        
        if(op!=null && op.equals("login")){
            String userid=request.getParameter("userid");
            String password=request.getParameter("password");
            AdminDao ad = new AdminDao();
            Admin admin = ad.getByLoginDetails(userid, password);
            if(admin==null){
                response.sendRedirect("alogin.jsp?errorMessage=Sorry! Invalid Userid or Password");
            }
            else {
                String remember = request.getParameter("remember");
                System.out.println("Remeber :" +remember);
                if(remember!=null && remember.equalsIgnoreCase("remember")){
                    Cookie c1 = new Cookie("adminUserid", userid);
                     Cookie c2 = new Cookie("adminPassword", password);
                     c1.setMaxAge(60*60*24*30);
                     c1.setMaxAge(60*60*24*30);
                     response.addCookie(c1);
                     response.addCookie(c2);
                }
                HttpSession  session = request.getSession();
                session.setAttribute("admin", admin);
                response.sendRedirect("admin/dashboard.jsp");
            }
        }
        
         
    }

     
}
