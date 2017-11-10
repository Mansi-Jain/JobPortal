

<% if(session.getAttribute("isSessionSet")==null){
        if(request.getParameter("id")==null||request.getParameter("id").equals("")){
            response.sendRedirect("index.jsp");
        }
   }
   else{
    String userId="";
        if(request.getParameter("id")==null||request.getParameter("id").equals("")){
            userId = session.getAttribute("userId").toString();
        }
         else{
            userId=request.getParameter("id");
         }
%>    
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="includes/connection.jsp" %>
<%
    Statement stmt2 = con.createStatement();
    ResultSet rs = stmt2.executeQuery("select * from individual where id ="+userId);
    if(!rs.next())
    {
        response.sendRedirect("index.jsp");
        //System.exit(0);
    }
    String title="JobPortal | "+rs.getString("fname")+" "+rs.getString("lname")+"'s Profile"; 
%>
<%@include file="includes/head.jsp" %>
<body>
    <%@include file="includes/menu.jsp" %>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <%@include file="includes/jobs-sidebar2.jsp" %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
            <table class="table table-hover">
                <tbody>
                    <tr class="success">
                        <td><p class="text-error">Name</p> </td><td><%=rs.getString("fname")+" "+rs.getString("lname") %></td>
                    </tr>
                    <tr>
                        <td>Email - Id:</td> <td><%=rs.getString("emailid") %></td>
                    </tr>
                    <tr>
                        <td>Qualification</td> <td><%=rs.getString("qualification") %></td>
                    </tr>
                    <tr>
                        <td>Skills </td> <td><%=rs.getString("skills")%></td>
                    </tr>
                    <tr>
                        <td>Work Experience</td> <td><%=rs.getString("work_ex") %></td>
                    </tr>
                    <tr>
                        <td>Address</td> <td><%=rs.getString("address")+" "+rs.getString("city")+" "+rs.getString("country") %></td>
                    </tr>
            </tbody>
            </table>
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; JobPortal 2017</p>
      </footer>

    </div>
    <script type="text/javascript">
      $('.dropdown-toggle').dropdown();
    </script>
    <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
</body>
</html>
<%
   }
%>