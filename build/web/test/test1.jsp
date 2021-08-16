<%-- 
    Document   : test1
    Created on : 24-Jun-2021, 09:12:03
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
            $("p").hide();
            });
            </script>
   
    </head>
    <body>
        <h1>Hello World!</h1>
        <button  id="b1">Show Paragraphs</button>
        <br/>
        <button  id="b2">Hide Paragraphs</button>
        <button id="b3">Hide/Show</button>

 <p style="width:200px;height: 100px;border:2px solid blue"> This is para -1</p>
        <p id="p2" style="width:200px;height: 100px;border:2px solid red"> This is para- 2</p>
    
     <hr/>
     <button id="b4">Slide Toggle</button>
     <div id="d1" style="width:300px;height: 200px;background-color: gray;color:white;">
         This is Division<br/> This is Division<br/> This is Division<br/> This is Division<br/>
          This is Division<br/> This is Division<br/> This is Division<br/> This is Division<br/>
           This is Division<br/> This is Division<br/> This is Division<br/> This is Division<br/>
           
     </div>
        <!-- Jquery Section is defined at the end of the page -->
        <script>
         $("#b1").click(function(){
             $("p").show(1000,function(){alert('paragraph is visible now..')});
             //alert('paragraphs  are visible now');
         });
         
         $("#b2").click(function(){
             $("p").hide(2000,function(){alert('para is hidden now ...')});
             //alert('paragraphs are hidden now');
         });
         $("#b3").click(function(){
             //$("p").toggle(1000);
             $("p").fadeToggle(2000);
         });
         $("#b4").click(function(){$("#d1").slideToggle(2000);});
        </script>
    </body>
</html>
