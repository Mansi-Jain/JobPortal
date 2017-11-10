(session.getAttribute("profileType")==null)
    response.sendRedirect("index.jsp");
if(session.getAttribute("profileType")!=null)
    if(!session.getAttribute("profileType").toString().equalsIgnoreCase("company"))
        response.sendRedirect("index.jsp");    
%>
<%@include file="includes/connection.jsp" %>
<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title="Job Portal | Edit Profile";%>
<% if(request.getMethod()=="POST"){ 
      try{
%>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
<%
          String cname = "";
          String phoneno="";
          String goals = "";
          String type = "";
          String address = "";
          String city = "";
          String country = "";
          String picture = "";          
          try{
              Statement stmt = con.createStatement();
             // String query1 = "insert into individual(fname,lname,qualification,skills,work_ex,address,city,country) value('"+fname+"', '"+lname+"', '"+qulification+"', '"+skills+"', '"+work_ex+"', '"+address+"', '"+city+"', '"+country+"');";
             // stmt.executeUpdate(query1);
              stmt.close();
          }
          catch(Exception e){
                  e.printStackTrace();
          }
          boolean isMultipart = ServletFileUpload.isMultipartContent(request);
          if(isMultipart){
              FileItemFactory factory = new DiskFileItemFactory();              
              ServletFileUpload upload = new ServletFileUpload(factory);
              List items = null;
              try{
                items = upload.parseRequest(request);
              }
              catch(Exception e){
                  e.printStackTrace();
              }
              Iterator iterator = items.iterator();
              while(iterator.hasNext()){
                  FileItem item = (FileItem) iterator.next();
                  if(item.isFormField()){
                //     out.print(item.getFieldName());
                     if(item.getFieldName().equalsIgnoreCase("cname")) {
                         cname=item.getString();
                     }                     
                     else if(item.getFieldName().equalsIgnoreCase("goals")) {
                         goals=item.getString();
                     }
                     else if(item.getFieldName().equalsIgnoreCase("type")) {
                         type=item.getString();
                     }
                     else if(item.getFieldName().equalsIgnoreCase("phoneno")) {
                         phoneno=item.getString();
                     }
                     else if(item.getFieldName().equalsIgnoreCase("address")) {
                         address=item.getString();
                     }
                     else if(item.getFieldName().equalsIgnoreCase("city")) {
                         city=item.getString();
                     }
                     else if(item.getFieldName().equalsIgnoreCase("country")) {
                         country=item.getString();
                     }
                  }
                  else{
                      String fileName = item.getName();
                      String fileType = item.getContentType();
                     // out.print(fileType);
                      if(fileType.toLowerCase().contains("jpg")||fileType.toLowerCase().contains("png")) {
                           picture = session.getAttribute("userId").toString()+cname+"."+fileType.split("/")[1];
                           File savedFile = new File(config.getServletContext().getRealPath("/")+"uploads/com/logos/"+picture);
                           item.write(savedFile); 
                         //  out.print(picture);
                          // picture="uploads/ind/resumes/"+session.getAttribute("userId").toString()+fname+fileType;
                      }
                        //out.print("hello");
                      
                  }
              }
          }
          try{
              Statement stmt = con.createStatement();
              try{
//              out.print("hello"+fname+lname+skills);
              String query="update company set cname='"+cname+"', type='"+type+"', goals='"+goals+"', phoneno='"+phoneno+"', address='"+address+"', city='"+city+"', country='"+country+"' where cid="+session.getAttribute("userId");
              stmt.executeUpdate(query);
                           }
              catch(Exception e){
                  out.print(e.toString());
              }            
              stmt.close();
          }                 
          catch(Exception e){
            out.print(e.toString());
          }
      }      
      catch(Exception e){
          out.print(e.toString());
         out.print(e.toString());
      }
    }
    Statement stmt = con.createStatement();
    String query = "select * from company where cid="+session.getAttribute("userId");
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
%>
<%@ include file="includes/head.jsp" %>
<body>
  <%@include file="includes/menu.jsp" %>
  <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
        </div><!--/span-->
        <div class="span9">
<%            
    try{
%>
            <form action="" method="POST" enctype="multipart/form-data">
                  <legend>Edit Company Profile.</legend>
                  <label>Company name</label>
                  <input type="text" name="cname" value="<%=rs.getString("cname")%>"placeholder="Company Name" required>
                    <label>Head Office Address</label>
                    <input type="text" name="address" value="<%=rs.getString("address")%>" placeholder="Address of Company" required>
                    <label>City</label>
                    <input type="text" name="city" value="<%=rs.getString("city")%>" placeholder="City" required>
                    <label>Country</label>
                    <input type="text" name="country" value="<%=rs.getString("country")%>" placeholder="Country" required>
                    <label>Contact Number</label>
                    <input type="tel" name="phoneno" value="<%=rs.getString("phoneno")%>" placeholder="Contact Number" required >              
                    <label>Company Goals:</label>
                    <input type="text" name="goals" value="<%=rs.getString("goals")%>" placeholder="Goals" required>
                    <label>Company Type</label>
                    <input type="text" name="type" value="<%=rs.getString("type") %>" placeholder="Type of Company" >
                    <br>
                  <button type="submit" class="btn">Save Details</button>
                </form>
<%
   }
    catch(Exception e){
        out.print(e.toString());
        e.printStackTrace();
    }
%>    
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