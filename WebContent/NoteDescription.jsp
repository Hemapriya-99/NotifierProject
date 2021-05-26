<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Notifier</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  text-indent: -9px;
  position:absolute;
  padding-left:88%;
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
  top: 100px;
  right: 16px;
  font-size: 15px;
  input:focus;textarea:focus; select:focus;
  border-width:0px;
  border:none;
  outline:none;
}
.form-container input[type=text], .form-container input[type=date] {
  width: 460px;
  height: 40px;
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
body {
  font-family: "Lato", sans-serif;
}
</style>
<script>
function validate()
{ 
	 var notename = document.form.notename.value; 
     var startDate= document.form.startDate.value;
     var endDate = document.form.endDate.value;
     var remainderDate = document.form.remainderDate.value;
     var notestatus = document.form.notestatus.value;
     var description = document.form.description.value;
    
     
     if (notename==null || notename=="")
     { 
     alert("Name can't be blank"); 
     return false; 
     }
     else if(startDate==null || startDate=="")
     { 
     alert("StartDate can't be blank"); 
     return false; 
     } 
     else if (endDate==null || endDate=="")
     { 
     alert("EndDate can't be blank"); 
     return false; 
     }
     else if(remainderDate==null || remainderDate=="")
     { 
     alert("RemainderDate can't be blank"); 
     return false; 
     } 
     else if(notestatus==null || notestatus=="")
     { 
     alert("Status can't be blank"); 
     return false; 
     } 
     else if(description==null || description=="")
     { 
     alert("Description can't be blank"); 
     return false; 
     } 
 } 
 
</script>
</head>
<body style="background-color:Gainsboro">
 
<div class="topnav">
  <a  href="#" style="font-size:25px;cursor:pointer;color:white;" onclick="openNav()">&#9776</a>
  <div class="topnav-right" style="align:center;">
   
   
  <a  data-toggle="modal" data-target="#NotificationDetails" class="fa fa-bell-o" aria-hidden="true" href="#" style="font-size:22px"></a>  
  <!--  <a href="#" class="navbar-right "data-toggle="modal" data-target="#NotificationDetails"><span class="glyphicon glyphicon-bell"></span></a></li> -->
  <a class="fa fa-sign-out" href="LogoutServlet" style="font-size:22px;">Logout</a>
 </div>
</div>
<br><br><br>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 <a href="" style="color:white;font-size:0.7cm;">  </a><br>
 <!--   <=request.getAttribute("userName") %>  </a>  -->
  <br><br><br><br>
  <a href="Notebooks.jsp">Notebooks</a>
  <a href="NoteDescription.jsp">Notes</a>
  <a href="Update.jsp">Edit User</a>
</div>

<!--  <div class="search-container">
<input type="text" placeholder="Search" name="search">
<button class="btn btn-default" type="submit" style="background-color:Gainsboro">
      <strong><i class="glyphicon glyphicon-search" ></i></strong>
      </button>
</div>  -->

<form class="navbar-form navbar-right" action="" style="position:absolute;right:2%;">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit" style="color:white;background-color:#869099">
        <i class="glyphicon glyphicon-search" ></i>
      </button>
      
    </div>
  </div>
</form> 
<br>
 <!-- Trigger the modal with a button -->

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Header</h4>
        </div>
        <div class="modal-body">
        <form action="add" method="post">
          <input class ="form-control" type="text" placeholder="Enter Notebook name" name="notebook"><br>
          <button class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      </ul>
    </div>
    
    <!-- TO VIEW THE NOTES -->
    <div style="position:absolute;left:4%;top:15%">
<center><h1 >Notes</h1></center>

</div>
<br><br><br>
<div class="container">
  <div class="jumbotron">
  <form name="" action="addNotes">
<b> <span style="font-size:20px">Add Notes</span></b>
  <b><a href="" class="glyphicon glyphicon-plus" name="NotebookName" id="demo" class="navbar-right "data-toggle="modal" data-target="#fullNotes" style="color:black;text-decoration:none"></a>&nbsp;&nbsp;&nbsp;<a></a>
  <b><a href="" class="edit" class="glyphicon glyphicon-edit" class="navbar-right "data-toggle="modal" data-target="#editNote" style="color:black;text-decoration:none;position:absolute;right:13%;font-size:18px"><span class="glyphicon glyphicon-edit">Edit</span></a></b>&nbsp;&nbsp;&nbsp;
   <a href="" class="edit" class="glyphicon glyphicon-edit" class="navbar-right "data-toggle="modal" data-target="#viewNote" style="color:black;text-decoration:none;position:absolute;right:18%;font-size:18px"><span class="glyphicon glyphicon-book">View</span></a></b>&nbsp;&nbsp;&nbsp;
 <!--  <a href="" class="edit" class="glyphicon glyphicon-edit" class="navbar-right ">Delete</a>&nbsp;&nbsp;&nbsp;  --> 
 
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

 <%
      Connection connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/notifierapp","root","Hema@7999");
      Statement statement = connection.createStatement() ;
      ResultSet resultset = statement.executeQuery("select * from notedesc") ;
 %>
       
       
<%
String userName=(String)session.getAttribute("userName");
//System.out.println("Email is "+email);
session.setAttribute("email", userName);
%>
  </form>
    </div>
</div>

</div>
</div>
<br>

<div class="modal fade" id="viewNote" role="dialog">
 <div class="modal-dialog">
  <div class="modal-content">
        <div class="modal-header" >
        <h4>Notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form >
         <% while(resultset.next()){ %>
         <label><b>Name</b></label>
          <input class ="form-control" value=" <%= resultset.getString(1) %>"><br>
          <label><b>Start Date</b></label>
          <input class ="form-control" value=" <%= resultset.getString(2) %>"><br>
          <label><b>End Date</b></label>
          <input class ="form-control" value=" <%= resultset.getString(3) %>"><br>
          <label><b>Remainder Date</b></label>
          <input class ="form-control" value=" <%= resultset.getString(4) %>"><br>
          <label><b>Status</b></label>
          <input class ="form-control" value=" <%= resultset.getString(5) %>"><br>
          <label><b>Description</b></label>
          <input class ="form-control" value=" <%= resultset.getString(6) %>"><br>
           <% } %>
          </form>
        </div>
         
      </div>
      </div>
      </div>
        



  <!-- EDIT -->
<div class="modal fade" id="editNote" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Edit your Notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="EditNotesServlet" method="post">
          <label><b>Name</b></label>
          <input class ="form-control" type="text" placeholder="Enter Note name"><br>
          <label><b>Start Date</b></label>
          <input class ="form-control" type="date" placeholder="Enter Start Date"><br>
          <label><b>End Date</b></label>
          <input class ="form-control" type="date" placeholder="Enter End Date"><br>
          <label><b>Remainder Date</b></label>
          <input class ="form-control" type="date" placeholder="Enter Remainder Date"><br>
          <label><b>Status</b></label>
          <input class ="form-control" type="text" placeholder="Enter Status here"><br>
          <label><b>Description</b></label>
          <input class ="form-control" type="text" placeholder="Enter Note Description"><br>
           
          <button class="btn btn-primary" type="submit" style="position:relative;left:390px">Submit</button>
          </form>
           
        </div>
        
      </div>
      
    </div>
  </div>
  <!-- NOTIFICATION DETAILS -->
  <ul class="nav navbar-nav navbar-right">
              <div class="container">
  <!-- Trigger the modal with a button -->

  <div class="modal fade" id="NotificationDetails" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="position:absolute;text-align:left">Reminder</h4>
        </div>
        <div class="modal-body">
        <form action="add" method="post">
  
          </form>
        </div>

      </div>
      
    </div>
  </div>
      </ul>

  
  <!-- TO VIEW FULL DETAILS OF NOTES -->
  <div class="modal fade" id="fullNotes" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Add Notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
<div class="container">
   <form class="form-container" name="form" action="AddNotesServlet" method="post" onsubmit="return validate()">

 <label for="noteame"><b>Name</b></label><br>
   <input type="text" name="notename"><br>
 <label for="startDate"><b>Start Date</b></label><br>
   <input type="date" name="startDate"><br>
 <label for="endDate"><b>End Date</b></label><br>
  <input type="date" name="endDate"><br>
 <label for="remainderDate"><b>Remainder Date</b></label><br>
  <input type="date" name="remainderDate" ><br>
  <label for="notestatus"><b>Status</b></label><br>
  <input type="text" name="notestatus" ><br>
  <label for="description"><b>Description</b></label><br>
  <input type="text" name="description" ><br>
  <input class="btn btn-primary" type="submit" value="Save" style="position:relative;left:400px"></input>
</form> 
</div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

</script>
   
</body>
</html> 
