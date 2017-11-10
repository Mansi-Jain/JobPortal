

<% String title="JobPortal | About Us"; %>
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
            <div class="hero-unittext">
				<h3>- Being well informed is as necessary as being well prepared. -</h3>
				<h2>and that's why you should <span class="highlighthero">be on JobPortal</span></h2>
			</div>
			<div class="row-fluid">
				<div class="span8">
					<h1>About JobPortal</h1>
					<p>
                                            JobPortal is an experimental job search site developed by two Computer Engineering students of <em>Sardar Vallabhbhai National Institute Of Technology</em> and it aims to provide right job to right people and <em>vice-versa</em>.
					</p>
					<p>
						 It is advisable to both companies and Individuals to complete their profile details on the very first time they login.
					</p>
				</div>
				<div class="span4">
					<div class="tdiv t5">
                                            <br><br><p>As it's an experimental project and the developers are learning too. For any bug, feedback feel free to <a href="contact-us.jsp">Contact us</a>. Your comments mean a lot for us.</p>
						<p>						
						</p>
					</div>
				</div>
			</div>
			<br>
			<div class="row-fluid">
				<div class="span4">
					<h2>Companies</h2>
					<p>
						 Post all your vacancies for free and find your prospective employees. Our two way search engine makes sure you get right people for right job. 
					</p>
					
				</div>
				<div class="span4">
					<h2>Individuals</h2>
					<p>
						 Get your dream job from JobPortal. Find the jobs that matches with your profile, in the best way. Our two-way search engine will do it all for you!
					</p>					
				</div>				
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