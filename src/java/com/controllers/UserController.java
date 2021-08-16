 
package com.controllers;

import com.beans.User;
import com.daos.UserDao;
import com.sun.imageio.plugins.common.ImageUtil;
import com.util.ImageUtility;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class UserController extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         String op = request.getParameter("op");
         if(op!=null && op.equals("delete")){
             int id = Integer.parseInt(request.getParameter("id"));
             UserDao ud = new UserDao();
             if(ud.delete(id))
               response.sendRedirect("showUsers.jsp");
               else 
                   out.println("Record is not Deleted .....");

                 
         }
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        if(op!=null && op.equals("add")){
            String imgPath = ImageUtility.uploadImage(request, getServletConfig(), "media");
            if(imgPath!=""){
                HttpSession session=request.getSession();
                User user = (User)session.getAttribute("user");
                user.setPic(imgPath);
                
                UserDao ud = new UserDao();
               if(ud.add(user))
                   response.sendRedirect("showUsers.jsp");
               else 
                   out.println("Record is not inserted .....");
                
            }
            else{
                out.println("Image canot be uploaded...");
            }
        }
        if(op!=null && op.equals("update")){
            User user = (User)request.getAttribute("user1");
            UserDao ud = new UserDao();
            if(ud.update(user))
                response.sendRedirect("showUsers.jsp");
               else 
                   out.println("Record is not Updated .....");
                
        }
    }
}
