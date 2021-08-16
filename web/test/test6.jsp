<%-- 
    Document   : test6
    Created on : 25-Jun-2021, 09:11:00
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../assets/js/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
               $("#userid").change(function(){
                   $("#spcheck").load("../BloggerController?op=checkuserid&userid="+$(this).val());
               }); 
                
            });
            </script>
    </head>
    <body>
        <table style="border-style: solid;border-width: 2px;width: 100%; height: 200px">
            <tr>
                <td>Enter UserID<br/>(it must be your email id)</td>
                <td><input type="email" name="userid" id="userid" required class="form-control"/>
                    <br/> <span id="spcheck"></span></td>
            </tr>

        </table>
    </body>
</html>
