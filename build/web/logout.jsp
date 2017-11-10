<%
    session.setAttribute("isSessionSet", null);
    session.setAttribute("userName", null);
    session.setAttribute("userId", null);
    session.setAttribute("profileType", null);
    response.sendRedirect("index.jsp");
%>   
