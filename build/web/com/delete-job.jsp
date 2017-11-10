
<%@include file="../includes/connection.jsp" %>
<%
if(session.getAttribute("profileType")==null)
    response.sendRedirect("index.jsp");
if(session.getAttribute("profileType")!=null)
    if(!session.getAttribute("profileType").toString().equalsIgnoreCase("company"))
        response.sendRedirect("index.jsp");
if(request.getMethod()=="POST"){
    String jid=request.getParameter("jid");
    String query = "delete from joboffer where jid = "+jid;
    try{
        Statement stmt = con.createStatement();
        stmt.executeUpdate(query);
        out.print("<script>alert('Deleted Successfully');window.top.location.href='../com-home.jsp';</script>");
    }
    catch(Exception e){
        out.print(e.toString());
    }
}
    String title="JobPortal | Delete Job";
    String jid="";
    try{
        jid = request.getQueryString().split("=")[1];
    }
    catch(Exception e){
        out.print("<script>window.top.location.href='../com-home.jsp';</script>");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <title><%=title %></title>
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet"/>
</head>
<body style="background:#000;border: 8px solid #fff;">
<center>
    <p class="text-warning lead">Are you sure you want to delete this job?</p>
    <form method="POST" action="com/delete-job.jsp">
        <input type="hidden" name="jid" value="<%=jid%>">
        <button class="btn btn-danger">Yes</button>
    </form>
    <button class="btn btn-inverse" onclick="window.top.location.href='com-home.jsp';">No.</button>
</center>    
</body>
