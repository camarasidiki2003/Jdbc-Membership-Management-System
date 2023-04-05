<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Camara Credit Union</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Members list</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Member -->
			
			<input type="button" value="Register new member" 
				   onclick="window.location.href='add-member-form.jsp'; return false;"
				   class="add-member-button"
			/>
			
			<table>
			
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempMember" items="${MEMBER_LIST}">
					
					<!-- set up a link for each member -->
					<c:url var="tempLink" value="MemberControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="memberId" value="${tempMember.id}" />
					</c:url>

					<!--  set up a link to delete a member -->
					<c:url var="deleteLink" value="MemberControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="memberId" value="${tempMember.id}" />
					</c:url>
																		
					<tr>
						<td> ${tempMember.firstName} </td>
						<td> ${tempMember.lastName} </td>
						<td> ${tempMember.email} </td>
						<td> 
							<a href="${tempLink}">Update</a> 
							 | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this member?'))) return false">
							Delete</a>	
						</td>
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	
	</div>
</body>


</html>








