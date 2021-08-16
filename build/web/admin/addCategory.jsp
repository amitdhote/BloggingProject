<%-- 
    Document   : dashboard
    Created on : 31-May-2021, 08:03:30
    Author     : DELL
--%>

<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Admin"%>
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
        Admin admin = (Admin)session.getAttribute("admin");
        if(admin == null){
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
            <center><h2>Add a new category</h2></center>
            <form action="../CategoryController?op=add" method="post" class="form-group">
                Enter Name of category <br/>
                <input type="text" name="name" class="form-control"/> <br/>
                Enter Description 
                <textarea name="description" class="form-control"></textarea>
                <br/>
                <input type="submit" value="add" name="submit"/>
            </form>
            <hr/>
            <h2>List of Available Categories</h2>
            <hr/>
            <%
                CategoryDao cd = new CategoryDao();
                ArrayList<Category> clist = cd.getAllCategories();
              %>
              <table class="table table-striped">
                  <tr>
                      <td>Id</td>
                      <td>Name</td>
                      <td>Description</td>
                      <td>Operations</td>
                  </tr>
                  <% for (Category c : clist){%>
                  <tr>
                      <td><%=c.getId()%></td>
                      <td><%=c.getName()%></td>
                      <td><%=c.getDescription()%></td>
                      <td><a href="#" class="btn btn-success">Edit</a>
                          <a href="#" class="btn btn-danger">Delete</a></td>
                  </tr>
                  <%}%>
              </table>
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
      google.load('visualization', '1.0', {'packages':['corechart']});

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
          var options = {'title':'How Much Pizza I Ate Last Night'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>