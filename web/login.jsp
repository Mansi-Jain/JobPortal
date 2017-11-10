

<% if(request.getMethod()=="POST"){
%>
    <%@include file="includes/connection.jsp" %>
<%    
    String emailid=request.getParameter("emailid");
    String password=request.getParameter("password");
    String type=request.getParameter("type");
    String table="";
    String name="";
    String tid="";
    String redirect="";
    if(type.equalsIgnoreCase("1")){
        table="individual";
        name="fname";
        tid="id";
        redirect="index.jsp";
    }
    else if(type.equalsIgnoreCase("2")){
        table="company";
        name="cname";
        tid="cid";
        redirect="com-home.jsp";
    }
    else
        response.sendRedirect("index.jsp");
    try{
        Statement statement = con.createStatement();    
        String query="select "+tid+",emailid,"+name+" from "+table+" where emailid='"+emailid+"' and password='"+password+"';";
        ResultSet resultSet=statement.executeQuery(query);
        //out.print(emailid+password);
        resultSet.next();
        if(resultSet.getString(2).equalsIgnoreCase(emailid)){
            int id=resultSet.getInt(1);
            session.setAttribute("isSessionSet", true);
            session.setAttribute("userName", resultSet.getString(3));
            session.setAttribute("userId", id);
            session.setAttribute("profileType", table);
            out.print("<script>window.top.location.href=\""+redirect+"\";</script>");
            //response.sendRedirect("index.jsp");
        }
    }
        catch(Exception e){
           out.print(e.toString());
%>
<script type="text/javascript">alert("Invlid Username or Password, try again!");window.top.location.href="index.jsp";</script>
<%
           // response.sendRedirect("index.jsp");
        }
}
else{
    response.sendRedirect("index.jsp");
}
%>