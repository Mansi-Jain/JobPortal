

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% String title="Job Portal | Company SignUp"; %>
<% if(request.getMethod()=="POST"){
%>
<%@include file="includes/connection.jsp" %>
<%
        Statement statement=con.createStatement();
        String cname=request.getParameter("cname");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String emailid=request.getParameter("emailid");
        String password=request.getParameter("password");
        String phoneno=request.getParameter("phoneno");
        String goal=request.getParameter("goal");
        String type=request.getParameter("type");
        String query1="Insert into company (cname,emailid,password,address,city,country,phoneno,goal,type) value('"+cname+"', '"+emailid+"', '"+password+"', '"+address+"', '"+city+"', '"+country+"','"+phoneno+"','"+goal+"','"+type+"');";
        statement.executeUpdate(query1);
        statement.close();
        con.close();
        response.sendRedirect("index.jsp");
    }
%>
<%@include file="includes/head.jsp" %>
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
              <label>Company name</label>
              <input type="text" name="cname" placeholder="Company Name" required>
              <label>Goal</label>
              <input type="text" name="goal" placeholder="Goal" required>
              <label>Type</label>
              <input type="text" name="type" placeholder="Type" required>
              <label>Head Office Address</label>
              <input type="text" name="address" placeholder="Address of Company" required>
              <label>City</label>
              <input type="text" name="city" placeholder="City" required>
              <label>Country</label>
              <input type="text" name="country" placeholder="Country" required>
              <label>Contact Number</label>
              <input type="tel" name="phoneno" placeholder="Contact Number" required >              
              <label>Email-id</label>
              <input type="email" name="emailid" placeholder="Email-id" required>
              <label>Password</label>
              <input type="password" name="password" placeholder="Password" required>
              <label>Repeat-Password</label>
              <input type="password" name="password" placeholder="Repeat Password" required>
                  <!--<span class="help-block">Example block-level help text here.</span>-->
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