<!DOCTYPE html>
<html>

<head>
	<title>Member Sign In </title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-member-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Camara Credit Union</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Sign Up </h3>
		
		<form action="MemberControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
				<tbody>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="firstName" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="lastName" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="MemberControllerServlet">Back to Membership List</a>
		</p>
	</div>
</body>

</html>











