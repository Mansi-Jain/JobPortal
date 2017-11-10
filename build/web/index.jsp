

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% String title="JobPortal"; %>
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
          <div class="hero-unit" style="margin-bottom:20px;">
            <h1>Welcome to JobPortal!</h1>
            <img src="img/banner.jpg"><br><br>
            <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>
          </div>
          <div class="row-fluid">
            <div class="span4">
              <h2>Companies</h2>
              <p>Post all your vacancies for free and find your prospective employees. Our two way search engine makes sure you get right people for right job. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="span4">
              <h2>Individuals</h2>
              <p>Get your dream job from JobPortal. Find the jobs that matches with your profile, in the best way. Our two-way search engine will do it all for you!</p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
           <!-- <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
           -->
         </div>
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; JobPortal 2017</p>
      </footer>
    <script type="text/javascript">
    	$('.dropdown-toggle').dropdown();
    </script>
    <script type="text/javascript" src="js/bootstrap-dropdown.js"></script>
</body>
</html>