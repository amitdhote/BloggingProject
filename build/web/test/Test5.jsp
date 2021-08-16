<%-- 
    Document   : Test5
    Created on : 25-Jun-2021, 08:57:02
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
        <div id="d1" style="width:200px;height: 100px; background-color: black;color:white">
            this is division 
        </div>
        <button id="b1">Yellow</button> 
        <button id="b2">Red-Yellow</button>
        <button id="b3">Yellow-Red (using JS)</button>
        <script>
    $("#b1").click(function(){
        $("#d1").css("background-color","yellow");
    });
    
    $("#b2").click(function(){
        $("#d1").css({"background-color":"red", "color":"yellow"});
    });
    
    $("#b3").click(function(){
        //js code
        document.getElementById("d1").style.backgroundColor="yellow";
        document.getElementById("d1").style.color="red";
    });
    </script>
    </body>
    
</html>
