<%-- 
    Document   : sendOtp
    Created on : 09-Jul-2021, 10:00:07
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
        <h1>Mobile Varification Using OTP</h1>
        <pre>
            Enter Mobile <input type="text" id="mobile" required="required"/>
            <input type="button" value="send otp" id="b1"/>

            <div style="display: none" id="d1">
                <span id="s1"></span>
                Enter otp : <input type="text" id="otp"/> 
                <input type="button" id="b2" value="Varify"/>
            </div>

    <p id="p1">
        
        </p>
        </pre>
        <script>
            $("#b1").click(function(){
               // alert("ok");
                $.post("../SmsController?op=sendotp&mobile="+$("#mobile").val(),
                function(result,status){
                    $("#s1").html(result);
                    $("#d1").css({"display":"block"});
                })
            });
            
            $("#b2").click(function(){
               // alert("ok");
                $.get("../SmsController?op=varifyotp&otp="+$("#otp").val(),
                function(result,status){
                    $("#p1").html(result);
                     })
            });
            </script>
    </body>
</html>
