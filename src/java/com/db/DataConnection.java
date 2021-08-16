/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

import java.sql.*;
public class DataConnection {
    public static Connection getConnection(){
        Connection con =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
             con= DriverManager.getConnection("jdbc:mysql://localhost:3306/7am","root","");
            
        }catch(Exception e){
            System.out.println("Error in connection ....");
        }
        return con;
    }
}
