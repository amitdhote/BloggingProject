<%-- 
    Document   : test2
    Created on : 25-Jun-2021, 08:27:49
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
        <h1>JQuery Get / Set </h1>
        Enter first no :<input type="text" id="t1" name="t1"/> <br/>
        Enter second no :<input type="text" id="t2" name="t2"/><br/>
        <input type="button" value="add" id="b1"/>
        <br/>
        <p style="width:300px;height:50px;border-style: solid;border-width: 2px;" id="p1">
            RESULT WILL BE SHOWN HERE 
        </p>
        
        <script>
            $("#b1").click(function(){
                let s = parseInt($("#t1").val()) + parseInt($("#t2").val());
                $("#p1").html("<b>Sum = " + s +"</b>");
            });
            </script>
    </body> 
</html>
