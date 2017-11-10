
<% if(request.getMethod()=="POST"){%>
<script type="text/javascript">alert('Thanks for contacting Us!');</script>
<% } %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String title="JobPortal | Contact Us"; %>
<%@include file="includes/head.jsp" %>
<body>
    <%@include file="includes/menu.jsp" %>
     <div class="container-fluid">      
        <div class="span4 cform">
          <p>Thank you for wanting to get in touch with JobPortal, please leave a message or get on the phone and give us a call!</p>
          <form action="" method="POST">
            <label>Your Name:</label>
            <input class="contact-form" type="text" placeholder="Full Name">
            <label>Your email:</label>
            <input class="contact-form" type="email" placeholder="email id">
            <label>Your Message</label>
            <textarea class="contact-form" rows="3" cols="5"></textarea><br>
            <button type="submit" class="btn btn-block">Submit</button>
          </form>
        </div>
        <div class="span5 gmap">
          <iframe width="350" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?client=ubuntu&amp;channel=fs&amp;oe=utf-8&amp;q=jmi+new+delhi&amp;ie=UTF8&amp;hq=&amp;hnear=Centre+for+Management+Studies,+CMS+-+JMI,+Jasola,+New+Delhi,+Delhi+110025&amp;gl=in&amp;t=m&amp;z=14&amp;ll=28.557787,77.280832&amp;output=embed"></iframe><br /><small><a href="https://maps.google.co.in/maps?client=ubuntu&amp;channel=fs&amp;oe=utf-8&amp;q=jmi+new+delhi&amp;ie=UTF8&amp;hq=&amp;hnear=Centre+for+Management+Studies,+CMS+-+JMI,+Jasola,+New+Delhi,+Delhi+110025&amp;gl=in&amp;t=m&amp;z=14&amp;ll=28.557787,77.280832&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small>
        </div>
        <div class="span4 personal-contacts">
          <h3>Devloped By</h3>
          <p>Mansi Jain - +91 9461501784</p>
          <p>Simran Bawkar - +91 9725994015</p>
        </div>
      </div>     
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