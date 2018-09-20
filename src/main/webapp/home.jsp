<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">


<head>

	<title>HOME AUTOMATION</title>
	<link rel="shortcut icon" type="image/png" href="title.png"/>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style type="text/css">

		.footer {
			position: fixed;
			left: 0;
			bottom: 0;
			width: 100%;
			height: 2em;			
		}

		#company_box{font-size: 1em;background-color: #000a !important;}
		#company_initial{color: #fff;}
		#company_text{color: #08AA0F;}
		#company_name{color: #03A9F4;}

		body{
			background:#ccc url('http://www.a1concept.com/wp-content/uploads/2018/03/Fabulous-By-Office-Room-About-Office-Room.jpg') center center/cover no-repeat fixed;
			  -webkit-background-size: cover;
			-moz-background-size: cover;
			  -o-background-size: cover;
			  background-size: cover;
		}

		.btn-circle.btn-xl {
		    width: 50px;
		    height: 50px;
		    padding: 10px;
		    border-radius: 35px;
		    font-size: 24px;
		    line-height: 1.33;
		}


	</style>

</head>

<body>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);

if(	session.getAttribute("mobile")  == null && session.getAttribute("pass") == null){
	
	response.sendRedirect("index.jsp");
}

%>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><i class="fa fa-home fa-lg"></i> HOME AUTOMATION</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form method="POST" action="logoutprocess.jsp">
						<button type="submit" class="btn btn-primary" name="logout" style="margin: .5em;"><i class="fa fa-sign-out fa-md"></i> Logout </button>

					</form>
				</li>
			</ul>
		</div>
	</nav> 

	<div class="container">

		<div class="alert alert-success text-center" id="alert_success" style="display: none;"></div>

		<div class="alert alert-danger text-center" id="alert_dev_id_danger" style="display: none;"></div>
		<br>

		<div class="row">

			<div class="col-sm-6">
				<div class="panel panel-danger text-center">
					<div class="panel-heading"><h3>CONTROL </h3>

					<button type="button" id="create_device" data-toggle="tooltip" data-placement="bottom" title="Add Device" style="float: right;" class="btn btn-info btn-circle btn-xl"><i class="fa fa-plus fa-lg"></i></button><br>

					</div>
						
					<div class="panel-body">
					<br>
						<div id="dev_add" style="display: none;">
							<form method="post" >
								<div class="form-group ">
									<input type="text" class="form-control" name="dev_name"  placeholder="Enter Device Name" autocomplete="off" required>
								</div>
								<button type="submit" name="dev_submit" class="btn btn-success mb-2">Add Device</button>
							</form><br>

							<button type="submit" id="cancel" data-toggle="tooltip" data-placement="bottom" title="Cancel" class="btn btn-danger btn-sm"><i class="fa fa-times"></i></button>
							<br><br>
			<div class="alert alert-success text-center" role="alert">
				<strong>Lamp1 Device Created.</strong>
			</div>						</div>
						

							<div id="dev_select">
							<label> <i class="fa fa-lightbulb-o fa-lg" style="color: #FFA000;"></i> Device:</label><br>
							<select id="device_name" name="device_name" style="width: 20em;" required >
							<option value="">-- Select Device --</option>
							<!-- jquery -->
							
							</select>
							<br><br>
							
							<label><i class="fa fa-power-off fa-lg" style="color: #E64A19;"></i> Power:</label><br>
							<select id="ctrl_power" style="width: 20em;">
								<option value="">-- Select Power --</option>
								<option value="on">ON</option>
								<option value="off">OFF</option>
							</select>

							<br><br>

						</div>

					</div>
				</div>
				
				<div class="alert alert-success text-center" id="alert_success" style="display: none;"></div>
				<div class="alert alert-danger text-center" id="alert_dev_id_danger" style="display: none;"></div>
			</div>
			<div class="col-sm-6" style="padding-left: 5em;">
				<div class="panel panel-warning">
					<div class="panel-heading text-center"><h3>STATUS</h3></div>
					<div class="panel-heading text-center"><b style="float: left;">Device</b> | <b style="float: right;">Status</b></div>
					<div class="panel-body">

						<div id="status_group">
							<div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Light1: </label>
									</div>
									<div class="col-md-5"><span class="label label-success" style="float: right; font-size: 1.2em;">On</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Light2: </label>
									</div>
									<div class="col-md-5"><span class="label label-success" style="float: right; font-size: 1.2em;">On</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Fan1: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Light3: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Dev_2: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Ravi: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;L2: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;L2: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Laml: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Lamp1: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br><div class="row">
									<div class="col-md-5 text-center">
										<label style="float: left;"><i class="fa fa-cogs fa-lg" style="color: #795548;"></i> &nbsp;Lamp1: </label>
									</div>
									<div class="col-md-5"><span class="label label-warning" style="float: right; font-size: 1.2em;"">Off</span></div>
								</div><br>
						<hr>
						<div class="row">
							<div class="col-md-6">
								<label style="float: left;"><i class="fa fa-thermometer-three-quarters fa-lg" style="color: #8BC34A;"></i>
 									Temperature : &nbsp; <span class="label label-info" style="float: right; font-size: 1.2em;"> 27&deg;C</span>
 								</label>
							</div>						
						
							<div class="col-md-6">
								<label style="float: left;"><i class="fa fa-tint fa-lg" style="color: #0288D1;"></i>
									Humidity : &nbsp; <span class="label label-info" style="float: right; font-size: 1.2em;">60 %</span>
								</label>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br>

<footer class="footer">
	<div class="row text-center">
	<div class="col-md-12">
		<p class="label label-block label-default" id="company_box">
			<span id="company_initial">Powered By</span>
			<a href="http://os3infotech.com" target="_blank">
				<b id="company_text">OS3</b>
				<b id="company_name"> Infotech Pvt. Ltd.</b>
			</a>
		</p>
	</div>
</div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){

		var interval;
		interval = setInterval(function(){
			$("#status_group").load(location.href + " #status_group")}, 5000);

			$('[data-toggle="tooltip"]').tooltip();

			$("#create_device").click(function(){
			$("#dev_add").show();
			$("#dev_select").hide();
		});

		$("#cancel").click(function(){
			$("#dev_add").hide();
			$("#dev_select").show();
		});




//////control power on change...
$("#ctrl_power").on('change', function() {

	var device_name = $( "#device_name" ).val();
	var ctrl_power = $("#ctrl_power").val();
	var json =JSON.stringify({deviceName:device_name, control:ctrl_power});
	console.log(json);

	if (device_name == "") {
		$( "#alert_dev_id_danger" ).fadeTo(500, 1);
		$( "#alert_dev_id_danger" ).html("<strong>Select device before proceeding</strong>");
		$( "#alert_dev_id_danger" ).fadeTo(4000, 600).hide(600);
	}else if (ctrl_power == "") {
		$( "#alert_dev_id_danger" ).fadeTo(500, 1);
		$( "#alert_dev_id_danger" ).html("<strong>Select Power before proceeding</strong>");
		$( "#alert_dev_id_danger" ).fadeTo(4000, 600).hide(600);
	}else {

		$.ajax({
			url : "setcontrol",
			type: 'POST',
			dataType : 'JSON',
			data :json ,
			success: function(res){
				

				if (res.st == 1) {
					$("#alert_dev_id_danger").hide();
					$( "#alert_success" ).fadeTo(500, 1);
					$( "#alert_success" ).html("<strong>"+ device_name.toUpperCase() +"</strong> is Successfully set control <strong>" + ctrl_power.toUpperCase() + "</strong>");
					$("#alert_success").fadeTo(4000, 600).hide(600);
				}	else if (res.st == 2) {
					$( "#alert_dev_id_danger" ).fadeTo(500, 1);
					$( "#alert_dev_id_danger" ).html("<strong>Technical Error:</strong> Invalid Device selected");
					$("#alert_dev_id_danger").fadeTo(4000, 600).hide(600);
				}else if (res.st == 3) {
					$( "#alert_dev_id_danger" ).fadeTo(500, 1);
					$( "#alert_dev_id_danger" ).html("<strong>"+ device_name.toUpperCase() +"</strong> is Already set control <strong>" + ctrl_power.toUpperCase() + "</strong>");
					$("#alert_dev_id_danger").fadeTo(4000, 600).hide(600);
				}				
			},
		});
	}
});

/*  get list */

	$("#device_name").click(function(){
		var list="";
		
		$.get("getlist",function(data ,status){
			 var $select = $("#device_name");
             $select.find("option").remove(); 
			$.each( JSON.parse(data), function(key,value){
				console.log(key + " : "+ value);
				
				 list = "<option  value="+ value+">"+value+"</option>";		
				 $("#device_name").append(list);
				 list="";
			}); 
			
			
						
		});
		
		
	});
	


	
/* end list  */
	
	
	});



</script>


</body>

</html>