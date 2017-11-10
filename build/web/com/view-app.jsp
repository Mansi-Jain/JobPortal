

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../includes/connection.jsp" %>
<% String title="JobPortal | Applications"; %>
<!doctype html>
<html lang="en">
  <head>
    <title><%=title%></title>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="../css/colorbox.css" rel="stylesheet"/>
  </head>
  <body style="background:#efefef;">
      <table class="table">
          <thead>
              <tr>
                  <td>#</td><td>Name</td><td>Qualification</td><td>Skills</td><td>Work Exp</td>
              </tr>
          </thead>
          <tbody>
<%
    String jid = "";
    try{
       jid = request.getQueryString().split("=")[1];
    }
    catch(Exception e){
        e.printStackTrace();
    }
    String query="select * from applications,individual where ind_id=id and job_id="+jid;
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    int i =1;
    while(rs.next()){
%>
            <tr>
                <td><%=i %></td>
                <td><a href="../view-profile.jsp?id=<%= rs.getInt("id") %>" target="_blank"><i class="icon-share"></i> <%=rs.getString("fname")+" "+rs.getString("lname") %></a></td>
                <td><%=rs.getString("qualification")%> </td>
                <td><%=rs.getString("skills") %></td>
                <td><%=rs.getString("work_ex") %></td>
            </tr>
<%  i+=1;
    } 
%>            
          </tbody>
    </table>
  </body>
</html>