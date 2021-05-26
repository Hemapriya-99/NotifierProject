<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<body>
<h1></h1>
<form name="form" action="UserDetailServlet" method="post">
<table border="1">

<tr>
<td>username</td>
<td>mobilenumber</td>
<td>email</td>
<td>password</td>
<td>update</td>
</tr>
<%=request.getAttribute("userName") %>
<%=request.getAttribute("mobilenumber") %>
<%=request.getAttribute("email") %>
<%=request.getAttribute("password") %>
</table>
</form>
</body>
</html>