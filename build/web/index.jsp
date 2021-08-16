<%-- 
    Document   : index
    Created on : 24-May-2021, 08:30:53
    Author     : DELL
--%>

<%@page import="com.daos.BloggerDao"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="com.beans.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>MNIT Blog Project</title>

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

     


    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                  <!-- change the following conents only -->
                 <%
                     int pg =  request.getParameter("pg")==null? 0 : Integer.parseInt(request.getParameter("pg")); 
                     int start,stop=3;
                     start = pg*stop;
                     String cid = request.getParameter("cid"); 
                     BlogDao bd = new BlogDao();
                      ArrayList<Blog> blogList=new ArrayList<Blog>();
                     if(cid==null){
                     //show all approved blogs
                      blogList = bd.getBlogsByStatus("approved",start,stop);
                     }
                     if (cid!=null) {
                         //filter the blogs by category
                          blogList =bd.getBlogsByCategory(Integer.parseInt(cid), "approved");
                     }
                     if(request.getParameter("bid")!= null){
                       Blog blog = bd.getBlogDetailById(Integer.parseInt(request.getParameter("bid"))); 
                       blogList = new ArrayList<Blog>(); 
                       blogList.add(blog); 
                     }
                     
                     
                     for(Blog blog : blogList){%>
                     
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                        <img src="<%=blog.getPoster()%>" alt="" style="width:100%;height:300px;border-width:1px;border-style: double;border-radius: 10px;">
                    </div>
                    <div class="down-content">
                      
                        <a href="postDetails.jsp?id=<%=blog.getId()%>"><h4><%=blog.getTitle()%></h4></a>
                      <ul class="post-info">
                          <li><a href="postDetails.jsp?id=<%=blog.getId()%>"><%=(new BloggerDao().getById(blog.getBloggerId())).getName()%></a></li>
                        <li><a href="postDetails.jsp?id=<%=blog.getId()%>"><%=blog.getDate()%></a></li>
                        <li><a href="postDetails.jsp?id=<%=blog.getId()%>">12 Comments</a></li>
                      </ul>
                      <p><%=blog.getDescription().length()>200?blog.getDescription().substring(0,200):blog.getDescription()%>  
                          <br/>
                          <a rel="nofollow" href="postDetails.jsp?id=<%=blog.getId()%>" target="_parent" class="btn btn-success"> View Detail</a></p>
                      <div class="post-options">
                        <div class="row"> 
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">Beauty</a>,</li>
                              <li><a href="#">Nature</a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="#">Facebook</a>,</li>
                              <li><a href="#"> Twitter</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                  <%}%>
                  <div class="col col-md-12">
                      <span style="float:right"> <a href="index.jsp?pg=<%=pg+1%>" class="btn btn-primary <%=(start+stop)>= bd.getBlogCount("approved")? "disabled":""%>"> NEXT </a> </span>
                      
                      <span style="float:left"> <a href="index.jsp?pg=<%=pg-1%>" class="btn btn-primary <%=start==0?"disabled":""%>"> PREVIOUS </a> </span>
                  </div>
                     
              </div>
            </div>
          </div>
                
          
            
            
        <jsp:include page="sidebar.jsp"></jsp:include>
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