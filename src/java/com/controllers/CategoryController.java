/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Category;
import com.daos.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
public class CategoryController extends HttpServlet {

     

    
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
        if(op!=null && op.equals("add")){
            CategoryDao cd = new CategoryDao();
            Category c =new Category();
            c.setName(request.getParameter("name"));
            c.setDescription(request.getParameter("description"));
            
            if(cd.add(c))
                response.sendRedirect(request.getHeader("referer"));
            else
                out.println("Category cannot be added ....");
        }
    }

     
}
