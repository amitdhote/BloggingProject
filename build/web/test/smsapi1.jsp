<%-- 
    Document   : smsapi1
    Created on : 09-Jul-2021, 08:58:17
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
           <center>
               <h1>send sms using api</h1>
               Enter Mobile :   <input type="text" id="mobile" required/> 
               
               Enter SMS :
               <textarea id="sms" rows="10" cols="20" maxlength="160">
                   
               </textarea>
               
               <input type="button" id="b1" value="send"/>
               
               <p id="p1">
                   
               </p>
</center> 
        </pre>

        <script>
            $("#b1").click(function () {
                var settings = {
                    "async": true,
                    "crossDomain": true,
                    "url": "https://www.fast2sms.com/dev/bulkV2?authorization=pDwzYosH5y6vbAkihJ1RcIjZutBn3EMV0Lfdx8qaFe97CS4KmraDthGbgjCT2uUoEL1XNSny3dQ9KIJm&sender_id=TXTIND&message="+$("#sms").text()+"&route=v3&numbers="+$("#mobile").val(),
                    "method": "GET"
                }

                $.ajax(settings).done(function (result,status) {
                    $("#p1").html(result.message[0]);
                });
            });
        </script>
    </body>
</html>
