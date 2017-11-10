
<% 
if(session.getAttribute("profileType")==null)
    response.sendRedirect("index.jsp");
if(session.getAttribute("profileType")!=null)
    if(!session.getAttribute("profileType").toString().equalsIgnoreCase("company"))
        response.sendRedirect("index.jsp");
if(request.getMethod()=="POST"){
    int jid=0;
    String post_name = request.getParameter("post_name").toString();
    String job_desc = request.getParameter("job_desc").toString();
    String requirements = request.getParameter("requirements").toString();
    String work_ex = request.getParameter("work_ex").toString();
    String salary = request.getParameter("salary").toString();
%>
<%@include file="includes/connection.jsp" %>
<%
    try{
    Statement stmt = con.createStatement();
    String query = "insert into joboffer(cid,post_name,job_desc,requirements,work_ex,salary) value("+session.getAttribute("userId").toString()+",'"+post_name+"', '"+job_desc+"','"+requirements+"', '"+work_ex+"',"+salary+");";
    stmt.executeUpdate(query);
    query = "select jid from joboffer order by jid desc limit 0,1;";
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
    jid=rs.getInt("jid");
    rs.close();
    stmt.close();
    response.sendRedirect("job.jsp?id="+jid);
    }
    catch(Exception e){
        out.print("<script>alert('something went wrong');</script>"+e.toString());      
        e.printStackTrace();
    }
}
    String title="JobPortal | Post a Job Offer"; %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/head.jsp" %>
<body>
    <%@include file="includes/menu.jsp" %>
    <div class="container-fluid">
        <div class="span9">
            <form action="" method="POST">
                  <legend>Place your jobs to get right people.</legend>
                  <label>Post Name:</label>
                  <input type="text" name="post_name" placeholder="Post Name" required>
                  <label>Job Description:</label>
                  <textarea class="contact-form" name="job_desc" required rows="3" cols="5"></textarea><br>
                  <label>Skills Required:</label>
                  <input type="text" name="requirements" placeholder="Seperated by commas" required>
                  <label>Work Experience:</label>
                  <input type="text" name="work_ex" placeholder="Work Exp Required" required>                  
                  <label>Salary</label>
                  <input type="text" name="salary" placeholder="Salary" required>
                  <!--<span class="help-block">Example block-level help text here.</span>-->
                  <label class="checkbox">
                  <input type="checkbox" required> I've read all the Terms and Conditions of JobPortal.
                  </label>
                  <button type="submit" class="btn">Add Offer</button>
                </form>
        </div><!--/span-->      

      <hr>
    </div>
      <footer>
        <p>&copy; JobPortal 2017</p>
      </footer>
      <div class="clear"></div>
    <script type="text/javascript">
      $('.dropdown-toggle').dropdown();
    </script>
    <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
</body>
</html>