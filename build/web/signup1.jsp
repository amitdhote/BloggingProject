<%-- 
    Document   : index
    Created on : 24-May-2021, 08:30:53
    Author     : DELL
--%>

<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Category"%>
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
  <script type="text/javascript"> 
            function validateForm(){
                //alert('1');
                let status=true;
                pwd = document.getElementById("password").value;
                cpwd = document.getElementById("cpassword").value;
                //alert(pwd+cpwd);
                if(pwd!==cpwd){
                    //alert('password and confirm password must be same');
                    document.getElementById("cspan").innerHTML="password and confirm password must be same";
                     status=false;
                }
                g=0;
                genders = document.getElementsByName("gender");
                for(x =0;x<genders.length;x++)
                {
                    if(genders[x].checked)
                        g++;
                }
                
                 categories = document.getElementsByName("category");
                 c=0;
                for(x =0;x<categories.length;x++)
                {
                    if(categories[x].checked)
                        c++;
                }
                
                if(g==0)
                {
                    alert("Select Gender");
                    status=false;
                }
                
                 if(c==0)
                {
                    alert("Select Alteast one category");
                    status=false;
                }
                
                
                return status;               
            }
            
            function checkUserId(userid,span){
               //alert(userid);
               xml = new XMLHttpRequest();
               xml.open("GET","BloggerController?op=checkuserid&userid="+userid,true); 
               xml.send();
               
               xml.onreadystatechange=function(){
                   if(this.readyState==4 && this.status==200){
                       span.innerHTML = this.responseText;
                   }
               };
            }
            </script>
  
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
          <div class="col-lg-12">
            <div class="all-blog-posts">
              <div class="row">
                  <!-- change the following conents only -->
                  <div class="col col-md-12 col-sm-12" style="text-align: center">
                      <center> <h2 class="bg-success" style="border-radius: 5px;">Blogger Registration Form</h2> </center>
              </div> 
        <div class="container"> 
            <div class="row"> 
                <div class="col col-md-12 col-sm-12 col-lg-12">
    <center>
        <form action="signup2.jsp" method="post" onsubmit="return validateForm();" class="form-group">
            <table class="table">
            <tr>
                <td>Enter Name</td>
                <td><input type="text" name="name" id="name" required="required" class="form-control"/></td>
            </tr>
            <tr>
                <td>Enter Contact number</td>
                <td><input type="text" name="contact" id="contact" required class="form-control"/></td>
            </tr>
            <tr>
                <td>Enter UserID<br/>(it must be your email id)</td>
                <td><input type="email" name="userid" id="userid" required class="form-control" onchange="checkUserId(this.value,spcheck);"/>
                    <br/> <span id="spcheck"></span></td>
            </tr>
            <tr>
                <td>Enter Password(UpperCase, LowerCase, Number/SpecialChar and min 8 Chars)</td>
                <td><input type="password" name="password" id="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required class="form-control"/></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="cpassword" id="cpassword" class="form-control"/>
                    <span id="cspan" style="color:red;font-weight: bold;"></span>
                </td>
            </tr>
            <tr>
                <td>Select Your Gender</td>
                <td>
                <input type="radio" name="gender" value="Male" id="gen1" class="form-check-input"/>Male<br/>
                <input type="radio" name="gender" value="Female" id="gen2" class="form-check-input"/>Female<br/></td>
            </tr>
            <tr>
                <td>Select Your Hobbies</td>
                <td>
                <% ArrayList<Category> clist = new CategoryDao().getAllCategories();
                    for(Category c : clist){%>
                    <div class="col-md-12"><input type="checkbox" name="category" value="<%=c.getId()%>"/><%=c.getName()%></div>
               <%} %>
            </tr>
            <tr>
                <td><input type="reset" value="Clear all" name="reset" id="reset" class="btn btn-danget form-control"/></td>
                <td><input type="submit" value="Next Page" name="submit" id="submit" class="btn btn-primary form-control"/></td>
            </tr>
        </table>
        </form>
    </center>
                </div>
            </div>
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


   