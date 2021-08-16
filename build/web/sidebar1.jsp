<%@page import="com.beans.Comment"%>
<%@page import="com.daos.CommentDao"%>
<%@page import="com.beans.Blog"%>
<%@page import="com.daos.BlogDao"%>
<%@page import="com.daos.BloggerDao"%>
<%@page import="com.daos.CategoryDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<style>
    .current{
        border-style: solid;
        border-radius: 5px;
        background-color: gray;
        font-weight: bold;
    }
</style>
<div class="col-lg-4">
    <div class="sidebar">
        <div class="row">
             
            <div class="col-lg-12">
                <div class="sidebar-item recent-posts">
                    <div class="sidebar-heading">
                        <h2>Write Comments</h2>
                        <form method="post" class="form-group" action="CommentController?op=add">
                            Enter Your Name 
                            <input type="text" name="userName" class="form-control"/>
                            Write Comment 
                            <textarea name="description" rows="10" cols="20" class="form-control">
                                
                            </textarea>
                            <input type="hidden" name="blogId" value="${blog.id}"/>
                            <input type="hidden" name="bloggerId" value="${blog.bloggerId}"/>
                            <input type="submit" class="btn btn-primary form-control" name="submit"/>
                        </form>
                                </div>
                    <div class="content">
                         
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="sidebar-item categories">
                    <div class="sidebar-heading">
                        <h2>Another Comments and Replies</h2>
                    </div>
                    <%
                        CommentDao cd= new CommentDao();
                        ArrayList<Comment> commentList = cd.getAllCommentsByBlogId(Integer.parseInt(request.getParameter("id"))); 
                        for(Comment comment : commentList){%>
                        
                    <div class="content bg-success" style="border-radius: 10px;">
                        <p style="color:white;font-family: corbel;font-size:16px"><b>User : <%=comment.getUserName()%></b> <br/>
                        <%=comment.getDescription()%>
                        </p>
                        <p style="margin-left: 50px;color:wheat;font-family: corbel;font-size:16px">
                            <b>Blogger's Reply: </b>
                            <%=comment.getReply()%>
                        </p>
                    </div>
                        <br/>
                        <%}%>
                </div>
            </div>
             
        </div>
    </div>
</div>