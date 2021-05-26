<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Notifier</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
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
 padding-left:78%;
 top:12%;
}
body {
  font-family: "Lato", sans-serif;
}
</style>
</head>
<body style="background-color:Gainsboro">
 
<div class="topnav">
  <a  href="#" style="font-size:25px;cursor:pointer;color:white;" onclick="openNav()">&#9776</a>
  <div class="topnav-right" style="align:center;">
  <!--   <a  href="#" style="font-style:cursive;font-size:19px;" data-toggle="modal" data-target="#myModal">NEW NOTEBOOK</a> -->
   <a  data-toggle="modal" data-target="#NotificationDetails" class="fa fa-bell-o" aria-hidden="true" href="#" style="font-size:22px"></a>  
   <a class="fa fa-sign-out" href="LogoutServlet" style="font-size:22px;">Logout</a>
  </div>
</div>
<br><br><br>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<!--  <a href="Dashboard.jsp" style="color:white;font-size:0.7cm;"> Hai 
 <%-- request.getAttribute("userName") --%>  </a><br>
 -->
    <br><br><br><br>
  <a href="Notebooks.jsp">Notebooks</a>
  <a href="NoteDescription.jsp">Notes</a>
  <a href="Update.jsp">Edit User</a>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="position:absolute;float:left">Add Notebook</h4>
        </div>
        <div class="modal-body">
        
        
        <form action="NoteBookServlet" method="post">
          <input class ="form-control" type="text" placeholder="Enter Notebook name" name="noteBookName"><br>
        <!--   <button class="btn btn-primary">Submit</button> -->
         <input type="submit" value="Save"></input>
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

<br><br>
<div style="position:absolute;left:4%;top:15%">
<center><h1 >Note Books</h1></center>
</div>
<br><br>

<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>

 <%
      Connection connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/notifierapp","root","Hema@7999");
      Statement statement = connection.createStatement() ;
      ResultSet resultset = statement.executeQuery("select * from notedesc") ;
 %>
 
  <% while(resultset.next()){ %>
 

<div class="container">
  <div class="jumbotron" >
   <b><a href="NoteDescription.jsp" class="fa fa-book" style="color:black;font-size:20px;text-decoration:none;position:absolute;left:18%">&nbsp; <%= resultset.getString(1) %></a></b>&nbsp;
    
  <b><a href="" class="edit"  class="navbar-right" data-toggle="modal" data-target="#editNote" style="color:black;text-decoration:none;position:absolute;right:19%;font-size:18px"><span class="glyphicon glyphicon-edit">Edit</span></a></b>&nbsp;&nbsp;&nbsp;</b>
   <b>  <a href="#" class="edit"  class="navbar-right" data-toggle="modal" data-target="#deleteNote" style="color:black;text-decoration:none;position:absolute;right:12%;font-size:18px"><span class="glyphicon glyphicon-remove-sign">Delete</span></a></b>&nbsp;&nbsp;&nbsp;
  <!-- <a href="#" style="position:absolute;padding-left:69%;top:30%;">Delete</a>   -->
 
 <% } %>      
  </div> 
  
</div>


<!-- EDIT -->
<div class="modal fade" id="editNote" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Edit NoteBook</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="EditNotesServlet" method="post">
          <input class ="form-control" type="text" placeholder="Enter Note name"><br>
          <button class="btn btn-primary" type="submit" style="position:relative;left:390px">Submit</button>
          </form>
           
        </div>
        
      </div>
      
    </div>
  </div>
  
  <!-- DELETE -->
<div class="modal fade" id="deleteNote" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Delete NoteBook</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="" method="post">
          <input class ="form-control" type="text" placeholder="Enter Note name"><br>
          <button class="btn btn-primary" type="submit" style="position:relative;left:390px">Submit</button>
          </form>
           
        </div>
        
      </div>
      
    </div>
  </div>

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
    