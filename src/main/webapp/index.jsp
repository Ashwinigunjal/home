<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Dashboard</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Material Design for Bootstrap fonts and icons -->
   

  <style type="text/css">
 
  	.main-box{
  		height: 400px;
  		box-shadow: 5px 5px 5px #aaaaaa;
  		opacity: 0.8;
  		margin-top:100px;
  	}
  	
  	.btn{
  		text-transform: none;
  	}
  	.center-block {
	  display: center	;
	  /*margin-right: auto;
	  margin-left: auto;
	  */
	  margin : auto;
	  margin-top: 150px;
}



  </style>

</head>
<body  style="background-image: url('image/backgound_login.jpeg');" >
<div class="container">
	
	<div class="row h-100 justify-content-center align-items-center  ">

		<div class="col-md-5  ">
		<div class="col-md-12 card main-box" >
			
			<h3 class="text-center "><B>Welcome</B></h3>
			<h5 class="text-center ">Home Dashboard</h5>
			
			<form action="loginservlet" method="POST">
			
				<% 
				
				String error = (String)request.getAttribute("errorMessage");
				 if(error !=null){
				out.println("<p style='color: red'>"+ error+"</p>");
				
				 }
				 else{
					
					out.println("<p></p>");
				 }
				
				%>
				
				<input type="hidden" name="command" value="login">
				 <div class="form-group">
					<label for="mobile" class="bmd-label-floating">Mobile</label>
					<input type="text" class="form-control" id="mobile" name="mobile"pattern="[0-9]+" title="Please Enter only Words not number" minlength="10"  maxlength="10" >
					<!-- <span class="bmd-help">valid number</span> -->
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1" class="bmd-label-floating">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" name="password">
				</div><br>
				
					<button type="submit" class="btn  btn-raised  btn-success btn-block" ><b>Login<b></button>
			</form>
			
			<form action="/register.jsp" method="post">
				<div class=" text-center" >New User? <a href="#" class="text-info" >Signup</a></div>
			</form>
		</div>

	</div>

</div>

</div>



 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <script>$(document).ready(function() { $('body').bootstrapMaterialDesign(); });</script>
</body>
</html>