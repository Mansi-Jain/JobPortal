
<% String pageUrl = request.getRequestURL().toString(); %>
<div class="navbar">
    <div class="navbar-inner">
      <a class="brand" href="index.jsp">Job Portal</a>
        <ul class="nav">
            <% if(pageUrl.contains("index.jsp")){ %>
            <li class="active"><a href="#">Home</a></li>
            <%} else{ %>
          <li><a href="index.jsp">Home</a></li>
          <% } if(pageUrl.contains("about-us.jsp")){ %>
            <li class="active"><a href="#">About</a></li>
          <% } else{ %>
          <li><a href="about-us.jsp">About</a></li>
          <%} if(pageUrl.contains("contact-us.jsp")){ %>
            <li class="active"><a href="#">Contact</a></li>
          <% } else{ %>
              <li><a href="contact-us.jsp">Contact</a></li>
              <% } if(session.getAttribute("isSessionSet")==null){
          if(pageUrl.contains("ind-signup.jsp") || pageUrl.contains("com-signup.jsp")){ %>
          <li class="dropdown active">
              <% } else{ %>
          <li class="dropdown"><%}%>
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign Up <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <% if(pageUrl.contains("ind-signup.jsp")){ %>
                         <li class="active"><a href="#">As Individual</a></li>
                      <% } else { %> 
                         <li><a href="ind-signup.jsp">As Individual</a></li>
                     <%} if(pageUrl.contains("com-signup.jsp")){ %>
                        <li class="active"><a href="#">As Company</a></li>                     
                      <% } else{ %>
                        <li><a href="com-signup.jsp">As Company</a></li>   
                        <% } %>
                    </ul><% } %>
                  </li>
                </ul>
      <%                 
            if(session.getAttribute("isSessionSet")!=null){
                if(!session.getAttribute("profileType").toString().equalsIgnoreCase("company")){
       %>       
       <div class="pull-right">
           <li class="dropdown">
               <a href="#"class="dropdown-toggle" data-toggle="dropdown">
                   Hello <%=session.getAttribute("userName") %></a>
                   <ul class="dropdown-menu">
                       <% if(pageUrl.contains("edit-profile.jsp")){ %>
                       <li class="active"><a href="#"><i class="icon-edit"></i> Edit Profile</a></li>
                       <% } else { %>
                            <li><a href="edit-profile.jsp"><i class="icon-edit"></i> Edit Profile</a></li>
                            <% } %>
                       <% if(pageUrl.contains("view-profile.jsp")){ %>
                       <li class="active"><a href="#"><i class="icon-share"></i> View Profile</a></li>
                       <% } else { %>
                            <li><a href="view-profile.jsp"><i class="icon-share"></i> View Profile</a></li>
                            <% } %>
                            <li><a href="logout.jsp"><i class="icon-off"></i> Logout</a></li>
                   </ul>
           </li>                   
       </div>
       <%
             }
             else{
%>
                <%@include file="../com/menu.jsp" %>
<%
             }
            }
            else{
      %>
      <script type="text/javascript" src="js/jquery.colorbox.js"></script>
      <script>
           function show_colorbox()
           {
                //alert("login-form.jsp?emailid="+document.forms["login_form"]["emailid"].value);
                jQuery().colorbox({width:"380px", height:"450px", iframe:true, href:"login-form.jsp?emailid="+document.forms["login_form"]["emailid"].value});
               return false;
           }
       </script>
       <form name="login_form" class="navbar-form pull-right" onsubmit="return show_colorbox()" >
                <input type="hidden" name="type" value="1">
              <input class="span2" name="emailid" type="text" placeholder="Email">
              <input class="span2" name="password" type="password" placeholder="Password">
              <button type="submit" class="btn" >Login</button>
            </form>
      <%
            }
      %>
    </div>
  </div>