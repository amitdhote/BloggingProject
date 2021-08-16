<%-- 
    Document   : loadCities
    Created on : 02-Jul-2021, 09:35:09
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/jquery.min.js"></script>
    </head>
    <body>
        <h1>Fetching Json from Server</h1>
        <pre>
        <select id="state">
            <option> Select Any State </option>
        </select>
        

        <select id="city">
            <option>Select Your City </option>
        </select>

        <script>
    var states = new Array();        
    $.get("../TestingJson",{"op":"states"},function(result,status){
         //alert(result);
            
         states = JSON.parse(result);   //converting json into js array
         for(x in states){
            $("#state").append("<option value='"+states[x].id+"'>"+states[x].name+"</option>");
         }
        }); 
        
        $("#state").change(function(){
            $.get("../TestingJson",{"sid":$(this).val(),"op":"city"},
            function(result,status){
               // alert(result);
                let cities  = JSON.parse(result);   //converting json into js array
        $("#city").html("<option>Select Your City</option>"); 
        for(x in cities){
            $("#city").append("<option value='"+cities[x].id+"'>"+cities[x].name+"</option>");
         }
            });
        });
        </script>
    </body>
</html>
