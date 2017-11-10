<div class="pull-right">
           <li class="dropdown">
               <a href="#"class="dropdown-toggle" data-toggle="dropdown">
                   Hello <%=session.getAttribute("userName") %></a>
                   <ul class="dropdown-menu">
                       <% if(pageUrl.contains("com-home.jsp")){ %>
                       <li class="active"><a href="#"><i class="icon-home"></i> Home</a></li>
                       <% } else { %>
                            <li><a href="com-home.jsp"><i class="icon-home"></i> Home</a></li>
                            <% } %>
                       <% if(pageUrl.contains("com-edit.jsp")){ %>
                       <li class="active"><a href="#"><i class="icon-edit"></i> Edit Profile</a></li>
                       <% } else { %>
                            <li><a href="com-edit.jsp"><i class="icon-edit"></i> Edit Profile</a></li>
                            <% } %>
                            <li><a href="logout.jsp"><i class="icon-off"></i> Logout</a></li>
                   </ul>
           </li>                   
 </div>