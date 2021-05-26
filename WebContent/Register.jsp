<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifier</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script> 
function validate()
{ 
	 var username = document.form.username.value; 
     var mobilenumber= document.form.mobilenumber.value;
     var email = document.form.email.value;
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
     
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
     else if (password!=conpassword)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 
</script>
<style>
.login-dark {
  background:#222D32;
  min-height: 657px;
 
}

.login-dark form {
  max-width:500px;
  width:90%;
  background-color:#1A2226;
  background-attachment: fixed;
  padding:40px;
  border-radius:4px;
  transform:translate(-50%, -50%);
  position:fixed;
  top:50%;
  left:50%;
  color:#fff;
  box-shadow:3px 3px 4px rgba(0,0,0,0.2);
}

.login-dark .illustration {
  text-align:center;
  padding:15px 0 20px;
  font-size:100px;
  color:#2980ef;
}

.login-dark form .form-control {
  background:none;
  border:none;
  border-bottom:1px solid #434a52;
  border-radius:0;
  box-shadow:none;
  outline:none;
  color:inherit;
}

.login-dark form .btn-primary {
  background:#214a80;
  border:none;
  border-radius:4px;
  padding:11px;
  box-shadow:none;
  margin-top:26px;
  text-shadow:none;
  outline:none;
}

.login-dark form .btn-primary:hover, .login-dark form .btn-primary:active {
  background:#214a80;
  outline:none;
}

.login-dark form .forgot {
  display:block;
  text-align:center;
  font-size:16px;
  color:#6f7a85;
  opacity:0.9;
  text-decoration:none;
}

.login-dark form .forgot:hover, .login-dark form .forgot:active {
  opacity:1;
  text-decoration:none;
}

.login-dark form .btn-primary:active {
  transform:translateY(1px);
}
.logo-badge {
    color: #e6e6e6;
    font-size: 80px;
    font-weight: 800;
    letter-spacing: -10px;
    margin-bottom: 0;
}
.text-whitesmoke {
    color: whitesmoke;
}
</style>
</head>
<body>


<div class="login-dark">
 
    <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()" style="text-align:center">
     <h2 class="sr-only">Register Form</h2>
     <div class="illustration"><h1 class="logo-badge text-whitesmoke"><span class="fa fa-user-circle"></span></h1></div>
     
     
      <div class="form-group"><input  class="form-control" type="text" name="username" placeholder="Username"/></div>
      <div class="form-group"><input  class="form-control" type="number" name="mobilenumber" placeholder="Mobile Number" /></div>
      <div class="form-group"><input  class="form-control" type="email" name="email" placeholder="Email Id" /></div>
      <div class="form-group"><input  class="form-control" type="password" name="password" placeholder="Password"/></div>
      <div class="form-group"><input  class="form-control" type="password" name="conpassword" placeholder="Confirm Password"/></div>
    
         
      <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Sign Up</button></div>
        <a href="Login.jsp" class="forgot">Already a member? <span style="color:#2980ef">Login</span></a></form>
      </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
           
</body>
</html>