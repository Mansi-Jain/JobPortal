
<%@include file="includes/connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String title="JobPortal | Job Detail"; 
    Statement stmt = con.createStatement();
    String jid = request.getParameter("id");
    if(jid==null)
        response.sendRedirect("index.jsp");
    if(request.getMethod()=="POST"){
        boolean alreayApplied = false;
        String query = "select * from applications where job_id="+request.getParameter("jid");
        Statement stmt1 = con.createStatement();
        ResultSet rs = stmt1.executeQuery(query);
        while(rs.next()){
            if(rs.getInt("ind_id")==Integer.parseInt(session.getAttribute("userId").toString())){
                alreayApplied=true;
                break;
            }
        }
        if(alreayApplied){
            out.print("<script>alert('You have already Applied');</script>");
        }
        else{
            stmt1.executeUpdate("insert into applications value("+jid+","+session.getAttribute("userId")+");");
            out.print("<script>alert('Successfully Applied!');</script>");
        }
    }
    String query = "select * from joboffer as j,company as c where c.cid=j.cid and jid = "+jid;
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
%>
<%@include file="includes/head.jsp" %>
<body>
    <%@include file="includes/menu.jsp" %>
    <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">              
                <h4>Company Details:</h4> 

                <p>Name: <%=rs.getString("cname") %></p>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
            <table class="table table-hover">
                <tbody>
                    <tr class="success">
                        <td><p class="text-error">Post Name</p> </td><td><%=rs.getString("post_name") %></td>
                    </tr>
                    <tr>
                        <td>Company</td> <td><%=rs.getString("cname") %></td>
                    </tr>
                    <tr>
                        <td>Job Description</td> <td><%=rs.getString("job_desc") %></td>
                    </tr>
                    <tr>
                        <td>Skills Required</td> <td><%=rs.getString("requirements")%></td>
                    </tr>
                    <tr>
                        <td>Work Experience</td> <td><%=rs.getString("work_ex") %></td>
                    </tr>
                    <tr class="success">
                        <td>Salary</td> <td><p class="text-error"><%=rs.getString("salary") %></p></td>
                    </tr>
                    <tr>
                        <td>
                        <% if(session.getAttribute("isSessionSet")==null) {                           
                        %>
                                <center><button class="btn btn-success" onclick="show_colorbox()">Login to Apply</button></center>
                        <%  }
                            else if(session.getAttribute("profileType").toString().equalsIgnoreCase("individual")){
                        %>
                        <form method="POST">
                            <input type="hidden" name="jid" value="<%=request.getQueryString().split("=")[1] %>" >
                            <center><button class="btn btn-primary" type="submit">Apply</button></center>
                        </form>
                            <% } %>
                        </td>
                        <td>
                            <button class="btn btn-success" type="submit" onclick="window.top.location.href='index.jsp'">Go Home</button>
                        </td>
                    </tr>
                    
            </table>
        </div><!--/span-->      

      <hr>
    </div>
      <footer>
        <p>&copy; JobPortal 2017</p>
      </footer>
      <div class="clear"></div>
    <script type="text/javascript">
      $('.dropdown-toggle').dropdown();
    </script>
    <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
</body>
</html>
