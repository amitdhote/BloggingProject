<%-- 
    Document   : index
    Created on : 24-May-2021, 08:30:53
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Stand CSS Blog by TemplateMo</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="assets/css/owl.css">
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

-->
  </head>

  <body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- include header.jsp -->
    <jsp:include page="header.jsp"></jsp:include>
    

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
          
          
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

    <%
        Cookie cookies[] = request.getCookies();
        String userid="",password="";
        for(Cookie c :cookies){
            if(c.getName().equals("adminUserid"))
                userid=c.getValue();
            if(c.getName().equals("adminPassword"))
                password=c.getValue();
        }
        System.out.println(userid+","+password);
        %>


    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="all-blog-posts">
              <div class="row">
                  <!-- change the following conents only -->
                  
                <div class="col-lg-12">
                    <span style="color:red;font-family: corbel;font-size: 20px">${param.errorMessage}</span>
                    <fieldset style="border-style: solid;border-width:2px;">
                        <center><h2>Admin Login</h2></center>
                        <form action="AdminController?op=login" method="post" class="form-group">
                        Enter User name <input type="email" name="userid" value="<%=userid%>" required class="form-control"/>
                        <br/>
                        Enter Password <input type="password" name="password" value="<%=password%>" required class="form-control">
                        <br/>
                        <input type="checkbox" value="remember" name="remember"/>Remember me <br/>
                        <input type="submit" value="Login" name="submit" class="btn btn-primary"/>
                    </form>
                    </fieldset>
                </div>
              </div>
            </div>
          </div>
                
          
            
            
       <%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>
        </div>
      </div>
    </section>

    
        <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>