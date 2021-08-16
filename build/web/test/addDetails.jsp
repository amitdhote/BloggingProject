<%-- 
    Document   : addDetails
    Created on : 02-Jul-2021, 08:42:06
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
        <h1>Add Person Details</h1>
        <div id="d1" style="display: none;">
            <img src="loading.gif"/>
        </div>
        <pre>
            Enter Name  <input type="text" id="name" name="name"/>

            Enter Age   <input type="text" id="age" name="age"/>

                <input type="button" value=" Add More Person" id="b1"/>
<br/>
<table id="table1" style="width:500px;" border="2" cellspacing="0">
    <tr>
        <td>Name</td><td>Age</td> <td>Remove</td>
    </tr>
</table>
<br/>
    <input type="button" value="save to db" id="b2"/>

    <span id="s1" style="font-weight: bold"></span>
   </pre>
        
        <script>
            var persons=new Array();
            
            function remove(index){
                persons.splice(index,1);
                show();
            }
            function show(){
                $("#table1").html("<tr><td>Name</td><td>Age</td><td>Remove</td>");
                for(i in persons){
                    p = persons[i];
                    let row = "<tr><td>"+p.name+"</td><td>"+ p.age+"</td><td><a href='#' onclick='remove("+i+");'>Remove</a></tr>";
                    $("#table1").append(row);
                }
              }
            
            $("#b1").click(function(){
                let person={"name":$("#name").val(),"age":$("#age").val()};
                persons.push(person);
                show();
            });
            
            $("#b2").click(function(){
                let json = JSON.stringify(persons);
                $.post("../TestingJson",{"json":json},
                function(result,status){
                    $("#s1").html(result);
                })
            });
            
            
             $(document).ajaxStart(function () {
                    $("#d1").css("display","block");
                });

                $(document).ajaxComplete(function () {
                    $("#d1").css("display","none");
                });
              

            
        </script>
    </body>
</html>
