<%-- 
    Document   : test12
    Created on : 07-Jul-2021, 10:45:43
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
        <h1>Hello World!</h1>
        <div id="d1">
            
        </div>
        <script>
        $.get("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=100&date=10-08-2021",
        function(result,status){
            $("#d1").text(JSON.stringify(result));
        });    
        </script>
    </body>
</html>
