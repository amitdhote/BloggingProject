<%-- 
    Document   : test8
    Created on : 28-Jun-2021, 12:52:17
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
        Enter any Name : <input type="text" id="t1"/> <br/>
        <button>Load Ajax</button>
        <p id="p1">
            
        </p>
        
        <script> 
            $("button").click(function(){
                $.ajax({
                    url:"../TestingServlet",
                    type:"POST",
                    data:{data:$("#t1").val()},
                    success:function(result,status){
                        $("#p1").html("<b><font color='blue'>"+ result +"</font></b>");
                    }
                });
            });
            </script>
    </body>
</html>
