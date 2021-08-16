<%-- 
    Document   : test9
    Created on : 28-Jun-2021, 13:01:37
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
        <pre>
          <form action="../TestingServlet" method="get" id="form1">   
        Enter first no :    <input type="text" id="no1" name="no1"/> 

        Enter second no :   <input type="text" id="no2" name="no2"/>

        <input type="submit" value="add"/>
        </form>

        <button id="b1">Show Addition using Ajax </button>
        <p id="p1">
            
        </p>
            
        </pre>
        
        <script>
            $("#b1").click(function(){
                //$("#p1").load("../TestingServlet?no1="+$("#no1").val()+"&no2="+$("#no2").val());
            $("#p1").load("../TestingServlet?"+$("#form1").serialize());
            });
            </script>
    </body>
</html>
