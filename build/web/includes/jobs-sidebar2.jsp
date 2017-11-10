<%@include file="connection.jsp" %>
<%@page import="java.sql.ResultSet"%>

<li class="nav-header">Latest Job</li>
<% 
    String query = "select jid,post_name from joboffer order by jid desc limit 0,5";
    Statement stmt = con.createStatement();
    ResultSet rs1 = stmt.executeQuery(query);
    while(rs1.next()){
%>
<li><a href="job.jsp?id=<%=rs1.getString("jid")%>"><%=rs1.getString("post_name") %> </a></li>

<%
   }
%>
    <li class="nav-header">Hot Jobs</li>
<%    
    query = "select jid,post_name from joboffer order by salary desc limit 0,5";
    stmt = con.createStatement();
    rs1 = stmt.executeQuery(query);
    while(rs1.next()){
%>   
<li><a href="job.jsp?id=<%=rs1.getString("jid")%>"><%=rs1.getString("post_name") %> </a></li>

<%
   }
%>    
    <li class="nav-header">Freshers' Jobs</li>
<%    
    query = "select jid,post_name from joboffer where work_ex=0 order by salary desc limit 0,5";
    stmt = con.createStatement();
    rs1 = stmt.executeQuery(query);
    while(rs1.next()){
%>   
<li><a href="job.jsp?id=<%=rs1.getString("jid")%>"><%=rs1.getString("post_name") %> </a></li>

<%
   }
%>       
<script type="text/javascript">
    function showResult(str)
{
if (str.length==0)
  {
  document.getElementById("livesearch").innerHTML="";
  document.getElementById("livesearch").style.border="0px";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("livesearch").innerHTML=xmlhttp.responseText;
    document.getElementById("livesearch").style.border="1px solid #A5ACB2";
    }
  }
xmlhttp.open("GET","includes/livesearch.jsp?q="+str,true);
xmlhttp.send();
}
</script>
<br>
<li class="nav-header"> <i class="icon-search"></i> Live Search Jobs</li>
    <input type="text" name="search-term"  onkeyup="showResult(this.value)" placeholder="Enter Keyword..." class="input-medium search-query">
    <div id="livesearch" style="border:none">&nbsp;&nbsp;Search results...</div>