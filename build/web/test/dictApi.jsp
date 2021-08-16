<%-- 
    Document   : newsapi
    Created on : 05-Jul-2021, 16:33:10
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="../assets/js/jquery.min.js"></script>
       </head>
    <body>
        <div class="container"  style="font-size:20px;font-family:corbel">
            <div class="row">
                <div class ="col col-md-12">
                    Enter word : <input type="text" name="word" id="word"/>
                    <select id="language">
                        <option value="en_US">English (US) </option>
                        <option value="hi">Hindi</option>
                        <option value="fr">French</option>
                    </select>
                    <input type="button" id="b1" value="Show Meanings"/>
                </div>
            </div>
            <hr/>
            <div class="row" id="meaning">
                <div id="d1" style="display: none">
                    <img src ="loading.gif"/>
                </div>
                <div id="result">
                    
                </div>
            </div>
        </div>
        <script>
            $(document).ajaxStart(function () {
                    $("#d1").css("display","block");
                });

                $(document).ajaxComplete(function () {
                    $("#d1").css("display","none");
                });
                
                $("#b1").click(function(){
                    alert($("#language").val());
                    $.get("https://api.dictionaryapi.dev/api/v2/entries/"+$("#language").val()+"/"+$("#word").val(),function(result,status){
                    //alert(result);               
                    //$("#result").text(JSON.stringify(result)); 
                    $("#result").html("");
                    for (x in result){
                        data = result[x];
                        $("#result").css({"border-width":"2px","border-style":"solid","border-radius":"5px"});
                        $("#result").append("<br/><b>"+ data.word +"<br/>");
                        $("#result").append("<br/><b>phonetics : "+ data.phonetics[0].text +"<br/>");
                        $("#result").append("<br/><b>Audio :<audio controls><source src='"+ data.phonetics[0].audio+"' type='audio/mp3'></audio><br/>");
                        for(y in data.meanings){
                            $("#result").append(data.meanings[y].partOfSpeech);
                            $("#result").append(":"+data.meanings[y].definitions[0].definition +"<br/>");
                            $("#result").append("Example :"+data.meanings[y].definitions[0].example +"<br/>")    
            }
                    }
                    });
                });
        </script>
    </body>
</html>
