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
        <div class="container">
            <div class="row">
                <div class ="col col-md-12">
                    Enter Keyword : <input type="text" name="keyword" id="keyword"/>
                    <input type="button" id="b1" value="Search/Load News"/>
                </div>
            </div>
            <hr/>
            <div class="row" id="news">

            </div>
        </div>
        <script>
            $("#b1").click(function () {
                $.get("https://newsapi.org/v2/everything?q=" + $("#keyword").val() + "&from=2021-06-05&sortBy=publishedAt&apiKey=21f6b04f7efe489485c54aeef72cb961",
                        function (result, status) {
                            //var news = JSON.parse(result);
                            var articles = result.articles;
                            $("#news").html("");
                            for (x in articles) {
                                var article = articles[x];
                                var s = '<div class="card col col-md-3 col-sm-12 col-lg-3" style="border-width:2px;border-radius: 5px;border-style:solid;margin:5px;">\
                    <img class="card-img-top" src="'+article.urlToImage+'" alt="Card image" style="width:100%">\
                    <div class="card-body">\
                        <h4 class="card-title">'+ article.title+'</h4>\
                        <p class="card-text">'+ article.description+'</p>\
                        <a href="'+article.url+'" class="btn btn-primary stretched-link">Show News</a>\
                    </div></div>';
            
                                $("#news").append(s);

                            }
                        });

            });

        </script>
    </body>
</html>
