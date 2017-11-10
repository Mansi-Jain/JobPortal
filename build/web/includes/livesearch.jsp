
<%@ include file="connection.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String q = request.getQueryString().split("=")[1];
    String search = "select jid,post_name,cname from company as c,joboffer as j where (post_name like '%"+q+"%' or requirements like '%"+q+"%' or cname like '"+q+"%') and j.cid=c.cid order by jid desc";
    Statement stmt1 = con.createStatement();
    ResultSet rs1 = stmt1.executeQuery(search);
    int i = 0;
    while(rs1.next()){
%>
    <li><a href="job.jsp?id=<%=rs1.getInt("jid") %>"><i class="icon-share"></i><%=rs1.getString("post_name")+" @ "+rs1.getString("cname") %></a>
<%
    i+=1;
   }
    if(i==0){
%>        
        <p class="text-error"><i class="icon-remove-circle"></i> No such results.</p>
<%
    }
%>          