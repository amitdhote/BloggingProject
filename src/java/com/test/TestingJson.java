package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.sql.*;
import com.db.DataConnection;
public class TestingJson extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
           /* String jsonText = "{\"name\":\"amit\",\"age\":20,\"contacts\":[\"433221122\", \"4455667788\"]}";
            out.println(jsonText);
            //out.println(jsonText);
            JSONParser parser = new JSONParser();
            try{
            JSONObject object = (JSONObject) parser.parse(jsonText);
           // out.println("<br/>"+ object);
            out.println("<br/>" + object.get("name")+","+ object.get("age") +","+object.get("contacts"));
            
            JSONArray array = (JSONArray) object.get("contacts");
            for(int i=0;i<array.size();i++)
                out.println("<li>"+ array.get(i) +"</li>");
            
            
            //converting json object to string
            //1. create json object 2. convert to json string
            JSONObject student = new JSONObject();
            student.put("rollno", 1001);
            student.put("name", "amit kumar");
           // String contacts[] = {"33443322","33221122"};
           // student.put("contacts",contacts) ;
            out.println("<br/>Student data : " + student + " <b> name : </b> " + student.get("name"));
            
            //step 2:
                StringWriter json = new StringWriter();
                student.writeJSONString(json);
                out.println("<br/>Student record in json form : "+ json.toString());
            }catch(Exception e){}
            */
           String op = request.getParameter("op");
           if(op!=null && op.equals("states")){
               try{
                   Connection con =DataConnection.getConnection();
                   String sql = "select * from states";
                   PreparedStatement smt = con.prepareStatement(sql);
                   ResultSet rs = smt.executeQuery();
                   String json ="";
                   while(rs.next()){
                       json += "{\"id\":"+rs.getInt("id") +",\"name\":\""+ rs.getString("name")+"\"},";
                   }
                   json = json.substring(0, json.length()-1);
                   json = "[" + json + "]";
                  con.close();
                  out.println(json);
               }catch(Exception e){
                   System.out.println("Error  :"+ e.getMessage());
               }
           }
           if (op!=null && op.equals("city")){
               int sid = Integer.parseInt(request.getParameter("sid"));
               try{
                   Connection con= DataConnection.getConnection();
                   String sql = "select id,name from cities where sid=?";
                   PreparedStatement smt = con.prepareStatement(sql);
                   smt.setInt(1, sid);
                   ResultSet rs= smt.executeQuery();
                   //String json="";
                   JSONArray cities= new JSONArray();
                   while(rs.next()){
                       JSONObject city = new JSONObject();
                       city.put("id",rs.getInt("id"));
                       city.put("name",rs.getString("name"));
                       cities.add(city);
                   }
                   con.close(); 
                   StringWriter json = new StringWriter();
                   cities.writeJSONString(json);
                   out.println(json.toString());
               }catch(Exception e){
                   System.out.println("error :"+e.getMessage());
               }
           }
           
           
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String json = request.getParameter("json");
        JSONParser parser = new JSONParser();
        try{
        JSONArray persons = (JSONArray) parser.parse(json);
        //fetching one by one object:
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/7am","root","");
        con.setAutoCommit(false);
                
        for(int i=0;i<persons.size();i++){
            JSONObject person = (JSONObject)persons.get(i);
            //save to DB
            try{
                String sql = "Insert into json(name,age) values (?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, person.get("name").toString());
                smt.setInt(2,Integer.parseInt(person.get("age").toString()));
                smt.executeUpdate();
             }catch(Exception e){
                System.out.println("Database error : "+ e.getMessage());
            }
        }
        con.commit();
        con.close();
        out.println("Data Saved to Databse !!!");
        //out.println(persons);
        } catch(Exception e){
            System.out.println("Error :"+ e.getMessage());
        }
    }
}
