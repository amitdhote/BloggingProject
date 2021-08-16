<%-- 
    Document   : dashboard
    Created on : 31-May-2021, 08:03:30
    Author     : DELL
--%>


<%@page import="com.beans.Category"%>
<%@page import="com.beans.Admin"%>
<%@page import="com.daos.BloggerDao"%>
<%@page import="com.beans.Blogger"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <title>Visual Admin Dashboard - Home</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <!-- 
        Visual Admin Template
        https://templatemo.com/tm-455-visual-admin
        -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/templatemo-style.css" rel="stylesheet">


    </head>
    <body> 
        <%
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                response.sendRedirect("../alogin.jsp?errorMessage=Session Expired or No login found !!");
                return;
            }
        %>
        <!-- Left column -->
        <div class="templatemo-flex-row">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <!-- Main content --> 
                <div class="templatemo-content col-1 light-gray-bg">
                <jsp:include page="header.jsp"></jsp:include>
                    <div class="templatemo-content-container">
                        <center><h1>Details of Blogger </h1> </center>
                            <hr/>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            BloggerDao bd = new BloggerDao();
                            Blogger blogger = bd.getById(id);
                            ArrayList<Category> clist = bd.getBloggerCategories(id);
                        %>
                        <form action="../BloggerController?op=changeStatus" method="post">
                            <div class="card" class="col col-md-6 col-lg-6" style="font-size:20px;font-family: corbel;">
                                <input type="hidden" name="id" value="<%=blogger.getId()%>"/>
                                <img class="card-img-top" src="../<%=blogger.getPic()%> " alt="Card image" style="width:350px;height: 400px; border-radius: 20px;">
                                <div class="card-body">
                                    <h4><%=blogger.getName()%></h4>
                                    <p class="card-text"><b>UserID</b> : <%=blogger.getUserid()%> </p>
                                    <p class="card-text"><b>Gender</b> : <%=blogger.getGender()%> </p>
                                    <p class="card-text"><b>Contact</b> : <%=blogger.getContact()%> </p>
                                    <p class="card-text"><b>Selected Categories </b> <br/>
                                        <%for (Category c : clist) {%>
                                        <li> <%=c.getName()%> </li>
                                        <%}%>
                                    </p>
                                    <p class="form-group"><b>Change Status </b> :<br/>
                                        <select name="status" class="dropdown-divider">
                                            <option value="pending" <%=blogger.getStatus().equals("pending")?"selected":""%>>Pending</option>
                                            <option value="approved" <%=blogger.getStatus().equals("approved")?"selected":""%>>Approved</option>
                                            <option value="rejected" <%=blogger.getStatus().equals("rejected")?"selected":""%>>Rejected/Denied</option>
                                        </select>
                                    </p>
                                    <a href="showBloggers.jsp" class="btn btn-success">Back</a>
                                    <input type="submit" class="btn btn-primary" value="Save">
                                </div>
                            </div>
                        </form>
                </div>
            </div>
        </div>

        <!-- JS -->
        <script src="assets/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
        <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
        <script>
            /* Google Chart 
             -------------------------------------------------------------------*/
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1.0', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Mushrooms', 3],
                    ['Onions', 1],
                    ['Olives', 1],
                    ['Zucchini', 1],
                    ['Pepperoni', 2]
                ]);

                // Set chart options
                var options = {'title': 'How Much Pizza I Ate Last Night'};

                // Instantiate and draw our chart, passing in some options.
                var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
                pieChart.draw(data, options);

                var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
                barChart.draw(data, options);
            }

            $(document).ready(function () {
                if ($.browser.mozilla) {
                    //refresh page on browser resize
                    // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
                    $(window).bind('resize', function (e)
                    {
                        if (window.RT)
                            clearTimeout(window.RT);
                        window.RT = setTimeout(function ()
                        {
                            this.location.reload(false); /* false to get page from cache */
                        }, 200);
                    });
                } else {
                    $(window).resize(function () {
                        drawChart();
                    });
                }
            });

        </script>
        <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

    </body>
</html>