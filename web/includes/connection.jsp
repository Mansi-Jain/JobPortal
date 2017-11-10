
<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="java.sql.*" errorPage=""%>
<%
    String url="jdbc:mysql://localhost:3306/JobPortal";
    String host="localhost";
    String user="root";
    String sql_password="root";
    //try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(url,user,sql_password);
    /*}
    catch(Exception e){
        out.println(e.toString());
    }*/
  %>