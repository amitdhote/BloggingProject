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
                <div class="sidebar-item search">
                    <form id="search_form" name="gs" method="GET" action="#">
                        <input type="text" name="q" class="searchText" placeholder="type to search..." autocomplete="on">
                    </form>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="sidebar-item recent-posts">
                    <div class="sidebar-heading">
                        <h2>Recent Posts</h2>
                    </div>
                    <div class="content">
                        <ul>
                            <%
                                BlogDao bd = new BlogDao();
                                ArrayList<Blog> blogList = bd.getBlogsByStatus("approved",0,3);
                                for (Blog blog : blogList) {%>
                            <li><a href="index.jsp?bid=<%=blog.getId()%>">
                                    <h5><%=blog.getTitle()%></h5>
                                     </a>
                                    <span><%=blog.getDate()%></span>
                               </li>
                                <%}%>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="sidebar-item categories">
                    <div class="sidebar-heading">
                        <h2>Categories</h2>
                    </div>
                    <div class="content">
                        <ul>
                            <%
                                String cid = request.getParameter("cid");
                                System.out.println("cid : " + cid);
                            %>
                            <li><a href="index.jsp" class="<%=cid == null ? "current" : ""%>">- All Categories </a></li>
                                <%
                                    ArrayList<Category> clist = new CategoryDao().getAllCategories();
                                    for (Category c : clist) {
                                %>
                            <li><a href="index.jsp?cid=<%=c.getId()%>" class="<%=cid != null && Integer.parseInt(cid) == c.getId() ? "current" : ""%>"  >- <%=c.getName()%></a> <span class="badge badge-secondary"><%=new BlogDao().getBlogCountByCategory(c.getId())%></span> </li>
                                <%}%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="sidebar-item tags">
                    <div class="sidebar-heading">
                        <h2>Tag Clouds</h2>
                    </div>
                    <div class="content">
                        <ul>
                            <li><a href="#">Lifestyle</a></li>
                            <li><a href="#">Creative</a></li>
                            <li><a href="#">HTML5</a></li>
                            <li><a href="#">Inspiration</a></li>
                            <li><a href="#">Motivation</a></li>
                            <li><a href="#">PSD</a></li>
                            <li><a href="#">Responsive</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>