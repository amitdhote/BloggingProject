<%-- 
    Document   : test7
    Created on : 25-Jun-2021, 09:35:44
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
            $(document).ready(function () {
               /* $(document).ajaxStart(function () {
                    $("#d1").css("display","block");
                });

                $(document).ajaxComplete(function () {
                    $("#d1").css("display","none");
                });
                */
                
            $("#b1").click(function () {
                    //$("#p1").load("../TestingServlet?data=" + $(this).val());
                    $.get("../TestingServlet",{data:$("#text1").val()},
                    function(result,status){
                        $("#p1").html("<h3>" + result  +"</h3>");
                        alert('status :'+ status);
                    })
                });
                
                $("#b2").click(function () {
                    //$("#p1").load("../TestingServlet?data=" + $(this).val());
                    $.post("../TestingServlet",{data:$("#text1").val()},
                    function(result,status){
                        $("#p1").html("<h3>" + result  +"</h3>");
                        alert('status :'+ status);
                    })
                });
 
            });
        </script>
    </head>
    <body>
        <div id="d1" style="display: none">
            <img src="loading.gif"/>
        </div>
        enter some text :<input type="text" id="text1"/> 
        <button id="b1">Load GET request</button>
        <button id="b2"> Load POST request</button>
        <br/>
        <p id="p1">

        </p>
    </body>
</html>
