<%-- 
    Document   : test10
    Created on : 29-Jun-2021, 08:37:08
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Json Example </h1>
        <script>
        jsonText = '[{"rollno":1001,"name":"ram"},{"rollno":1002,"name":"mukesh"}]'
        //convert to object
        students = JSON.parse(jsonText);
        for(i in students){
            document.write("<br/> I : " + i +"<br/>");
           // document.write("<br/>" + students[i]); //one object in each index[object object]
          //another loo: 
          student = students[i];
          for(j in student)
              document.write( student[j] +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
          document.write("<hr/>");
        }
        </script>
    </body>
</html>
