<%-- 
    Document   : test3
    Created on : 25-Jun-2021, 08:40:38
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
        Enter Some Text : 
        <input type="text" id="t1"/> 
        <br/>
        <input type="button" id="b1" value="append"/> 
        <input type="button" id="b2" value="prepend"/>
        
        <p style="width:300px;height:50px;border-style: solid;border-width: 2px;" id="p1">
            RESULT WILL BE SHOWN HERE 
        </p>
        
       <hr/>
       <table width="100%" border="2" cellspacing="0" id="tbl">
           <tr>
               <td>COl-1</td><td>col-2</td>
           </tr>
       </table>
       <button id="bt">Add Row</button>
        <script>
            $("#b1").click(function(){
                $("#p1").append($("#t1").val());
            });
             $("#b2").click(function(){
                $("#p1").prepend($("#t1").val());
            });
            
            $("#bt").dblclick(function(){
                $("#tbl").append("<tr><td>col-1</td><td>col-2</td>");
            });
            
            </script>
    </body>
</html>
