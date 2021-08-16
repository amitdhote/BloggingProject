<%-- 
    Document   : sendMail
    Created on : 12-Jul-2021, 15:49:41
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
            <h1>Sending Mail using Gmail server </h1>
            <br/>
            <span><h3>${param.result}</h3></span>
            <form action="../EmailController" method="post">
            Enter Recipients Address        <input type="text" name="recipients"  size="50"/>

            Enter Subject                   <input type="text" name="subject"/>

            Enter Message <br/>
            <textarea name="message" rows="15" cols="30">
                
            </textarea>
            
            <input type="submit" value="Send"/>
            </form>
        </pre>
        
    </body>
</html>
