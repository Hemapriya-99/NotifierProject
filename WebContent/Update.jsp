<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Notifier</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.topnav {
  overflow: hidden;
  background-color: #333;
}
.topnav a {
  float: left;
  color: #f2f2f2;
  padding: 14px 16px;
  text-decoration: none;
}
.topnav a:hover {
  background-color: #ddd;
}
.topnav-right {
  color:white;
  text-indent: -12px;
  position:absolute;
  padding-left:92%;
  top:1%;
}
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  top: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}
.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}
.sidenav a:hover {
  color: #f1f1f1;
}
.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}
.jumbotron {
  background-color:white;
  background-position: center-right;
}
.search-container {
 position:absolute;
 padding-left:78%;
 top:12%;
}
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}


/* The popup form - hidden by default */
.form-popup {
  position: absolute;
  left:30%;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  width: 500px;
  height:550px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=email],.form-container input[type=number] {
  width: 460px;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
<script> 
function validate()
{ 
	 var username = document.form.username.value; 
     var mobilenumber= document.form.mobilenumber.value;
     var email = document.form.email.value;
     var password = document.form.password.value;
    
     
     if (username==null || username=="")
     { 
     alert("Username can't be blank"); 
     return false; 
     }
     else if(mobilenumber.length!=10)
     { 
     alert("Mobile Number must be 10 characters"); 
     return false; 
     } 
     else if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
 } 
 
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}
function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
</head>

<body style="background-color:Gainsboro">

<div class="topnav">
  <a  href="#" style="font-size:25px;cursor:pointer;color:white;" onclick="openNav()">&#9776</a>
  <div class="topnav-right" style="align:center;">
   <a class="fa fa-sign-out" href="LogoutServlet" style="font-size:22px;">Logout</a>
  </div>
</div>
<br>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 <a href="" style="color:white;font-size:0.7cm;"><p>  </p> </a>
 <!--   <=request.getAttribute("userName") %> </p> </a>  -->
  <a href="Notebooks.jsp">Notebooks</a>
  <a href="NoteDescription.jsp">Notes</a>
  <a href="Update.jsp" >Edit User</a>
</div>

<div class="form-popup" >
  <form class="form-container" name="form" action="UserDetailServlet" method="post" onsubmit="return validate()">
    <h3 style="text-align:center">Edit User</h3>

 <label for="userName"><b>UserName</b></label><br>
   <input type="text" name="userName" required><br>
 <label for="mobilenumber"><b>MobileNumber</b></label><br>
   <input type="number" name="mobilenumber" required><br>
 <label for="email"><b>Email</b></label><br>
  <input type="email" name="email" required><br>
 <label for="password"><b>Password</b></label><br>
  <input type="text" name="password" required><br>
  <center><input type="submit" value="Save" style="background-color:green;color:white"></input></center>
</form>
</div>

</body>
</html>