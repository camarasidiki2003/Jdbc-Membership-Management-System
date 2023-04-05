<!DOCTYPE html>
<html>

<head>
	<title>Update Camara Credit Union Members Portal</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-member-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Update Camara Credit Union Members</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Camara Credit Union Members Portal</h3>
		
		<form action="MemberControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="memberId" value="${THE_MEMBER.id}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="firstName" 
								   value="${THE_MEMBER.firstName}" /></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="lastName" 
								   value="${THE_MEMBER.lastName}" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email" 
								   value="${THE_MEMBER.email}" /></td>
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
			<a href="MemberControllerServlet">Back to List</a>
		</p>
	</div>
</body>

</html>











