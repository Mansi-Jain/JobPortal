<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String title="JobPortal | Login"; %>
<%@include file="includes/head.jsp" %>
    <body style="background:#efefef;border: 8px solid #fff;">        
        <div id="form_wrapper" class="form_wrapper" style="background:#efefef;">    
            <form id="loginForm" class="login active" action="login.jsp" method="post">
		<h2>Login to JobPortal</h2>
                    <div>
			<label>Email Id</label>
                        <%
                            String email = "";
                            if (request.getQueryString()!=null){
                              try{
                                email = request.getQueryString().split("=")[1].trim();
                              }
                              catch(Exception e){
                                  e.printStackTrace();
                              }
                            } 
                            %> 
                        <input type="text" id="email" placeholder="Email Id" name="emailid" value="<%=email%>" class="email required" />
                    </div>
                    <div>
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Password" id="password" class="required" />
                        <label>Login As:</label>
                        <select name="type">
                            <option value="1">As Individual</option>
                            <option value="2">As Company</option>
                        </select>
                    </div>
                    <div class="bottom" style="padding:0px 0px 20px 20px;">
                        <button class="btn btn-primary" type="submit">Login</button><br><br>
                        <a href="ind-signup.jsp" rel="register" class="linkform">Create an Account</a>
                        <div class="clear"></div>
                    </div>
                        <input type="hidden" name="action" value="login" />
            </form>
</div>
    </body>
</html>
