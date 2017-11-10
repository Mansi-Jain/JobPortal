
<%
if(session.getAttribute("profileType")==null)
    response.sendRedirect("index.jsp");
if(session.getAttribute("profileType")!=null)
    if(!session.getAttribute("profileType").toString().equalsIgnoreCase("company"))
        response.sendRedirect("index.jsp");
    
    String title="JobPortal | Company Home";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/head.jsp" %>
<%@include file="includes/connection.jsp" %>
<%
    Statement stmt = con.createStatement();
    String query = "select * from joboffer where cid="+session.getAttribute("userId").toString()+" order by jid desc; ";
    ResultSet rs = stmt.executeQuery(query);
%>
<body>
    <%@include file="includes/menu.jsp" %>
    <div class="content-container" style="margin-left: 20px;">
        <center><button class="btn btn-large btn-primary" type="button" onclick="window.top.location.href='new-job.jsp';">Post New Job</button></center>
        <h3>Already Posted Jobs </h3>
        
        <div class="column">
        	<div class="table-wrapper">
                <table class="table">
                <tr>
                  <ul class="thumbnails">
			<th style="width:0px;"></th>
                    <th align="center" style="width:180px;">Post Name</th>
                    <th align ="center" style="width:200px;">Description</th>
                    <th>View Applications</th>
                    <th>Delete</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr class="success">			
                
		<td class="span2">
                    <span style="margin-right: 10px"><a href="job.jsp?id=<%=rs.getInt("jid") %>" class="thumbnail"><center><i class="icon-share"></i> View Job</center></a></span>
                </td>
                <td align="center"><%=rs.getString("post_name")%> </td>
                <td align="center"><%=rs.getString("job_desc") %></td>
                    <td width="60" align="center"><a href="com/view-app.jsp?id=<%=rs.getInt("jid") %>" class="btn view-stat"><img src="img/stats.png" style="position:relative; top:2px; right:0px;"/> View Stats</a></td>
                    <td width="60" align="center"><a href="com/delete-job.jsp?id=<%=rs.getInt("jid") %>" class="btn delete"><i class="icon-trash"></i><Delete</a></td>
		</tr>
                <script type="text/javascript" src="js/jquery.colorbox.js"></script>
                <script>
                   //alert("login-form.jsp?emailid="+document.forms["login_form"]["emailid"].value);
                    $(".delete").colorbox();
                    $(".view-stat").colorbox({width:"600px", height:"300px", iframe:true});
               </script>
                <% } %>
             </table>
        	</div>
        </div>
   
	<input type="submit" value="Add Another Job +" class="btn" style="margin:20px; font-size:16px;" onclick="window.location.href='new-job.jsp'" />

 
    </div>    
</body>
</html>