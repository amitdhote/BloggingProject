<%-- 
    Document   : test11
    Created on : 30-Jun-2021, 08:38:05
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
        <select id="state">
            <option selected>Select State</option>
        </select>
        
        <br><br/>
        <select id="city">
            <option selected>Select City</option>
        </select>
        <br/>
        
        <button id="b1">Load Json</button>
        <p id="p1">
            
        </p>
        
        <script>
            var states = null;
            $.get("../statecity.json",function(result,status){
                states = JSON.parse(result);
                for(x in states){
                    $("#state").append("<option value='"+x+"'>"+ x +"</option>")
                }
            });
            
            $("#state").change(function(){
                var cities = states[$(this).val()];
                $("#city").html("<option>Select City </option>");
                for(x in cities){
                     $("#city").append("<option value='"+cities[x]+"'>"+ cities[x] +"</option>")
                 
                }
            });
            
            $("#b1").click(function(){
                $("#p1").load("../statecity.json");
            });
    </script>
    </body>
</html>
