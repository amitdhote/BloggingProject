/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Comment;
import com.daos.CommentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CommentController extends HttpServlet {

    

     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        if(op!=null && op.equals("add")){
            Comment comment = new Comment();
            comment.setUserName(request.getParameter("userName"));
            comment.setDescription(request.getParameter("description"));
            comment.setBlogId(Integer.parseInt(request.getParameter("blogId")));
            comment.setBloggerId(Integer.parseInt(request.getParameter("bloggerId")));
            CommentDao cd = new CommentDao();
            if(cd.add(comment))
            {
                System.out.println("Comment added ....");
               response.sendRedirect(request.getHeader("referer"));
            }
            else
                out.println("<font color='red'> Comment cannot be added</font>");
            //request.removeAttribute("comment");
        }  
    }

     

}
