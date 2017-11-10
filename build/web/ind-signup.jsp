<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title="Job Portal | Individual SignUp";%>
<% if(request.getMethod()=="POST"){ %>
    <%@include file="includes/connection.jsp" %>
<%
      try{
        Statement stmnt=con.createStatement();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String emailid=request.getParameter("emailid");
        String password=request.getParameter("password");
        String qualification=request.getParameter("qualification");
        String skills=request.getParameter("skills");
        String work_ex=request.getParameter("work_ex");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String query="Insert into individual(fname,lname,emailid,password,qualification,skills,work_ex,address,city,country) value('"+fname+"', '"+lname+"', '"+emailid+"', '"+password+"', '"+qualification+"', '"+skills+"', '"+work_ex+"', '"+address+"', '"+city+"', '"+country+"');";
        stmnt.executeUpdate(query);
        stmnt.close();
        con.close();
        response.sendRedirect("index.jsp");
      }
      catch(MySQLIntegrityConstraintViolationException e){
     
     out.print("<script type=\"text/javascript\">alert('E mail Address already exist!');</script>");
     
      }
    }
%>
<%@ include file="includes/head.jsp" %>
<body>
  <%@include file="includes/menu.jsp" %>
  <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <%@include file="includes/jobs-sidebar.jsp" %>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
            <form action="" method="POST">
                  <legend>Sign Up to give your search a better place.</legend>
                  <label>First name</label>
                  <input type="text" name="fname" placeholder="Your First Name" required>
                  <label>Last Name</label>
                  <input type="text" name="lname" placeholder="Your Last Name" required>
                  <label>Email-id</label>
                  <input type="email" name="emailid" placeholder="Email-id" required>
                  <label>Password</label>
                  <input type="password" name="password" placeholder="Password" required>
                  <label>Repeat-Password</label>
                  <input type="password" name=password2"" placeholder="Repeat Password" required>
                  <!--<span class="help-block">Example block-level help text here.</span>-->
                  <label>Qualifications</label>
                  <input type="text" name="qualification" placeholder="Your Qualification" required>
                  <label>Skills</label>
                  <input type="text" name="skills" placeholder="Separated by commas" required>
                  <label>Work Experience</label>
                  <input type="text" name="work_ex" placeholder="0 if fresher" required>
                  <label>Address</label>
                  <input type="text" name="address" placeholder="Present Address" required>
                  <label>City</label>
                  <input type="text" name="city" placeholder="City" required>
                  <label>Country</label>
                  <input type="text" name="country" placeholder="Country" required>
                  <label class="checkbox">
                  <input type="checkbox" required> I've read all the Terms and Conditions of JobPortal.
                  </label>
                  <button type="submit" class="btn">Submit</button>
                </form>
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