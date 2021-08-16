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
      </head>
    <body>
        <pre>
           <center>
               <h1>send sms using api</h1>
               <form action="../SmsController?op=sendsms" method="post"> 
               <span style="font-weight: bold"> ${param.msg} </span> <br/>
               Enter Mobile :   <input type="text" id="mobile" name="mobile" required/> 
               
               Enter SMS :
               <textarea id="sms" name="sms" rows="10" cols="20" maxlength="160">
                   
               </textarea>
               
               <input type="submit" id="b1" value="send"/>
               </form>
</center> 
        </pre>
    </body>
</html>
