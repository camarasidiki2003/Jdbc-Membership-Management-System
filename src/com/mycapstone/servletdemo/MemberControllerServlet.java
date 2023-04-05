package com.mycapstone.servletdemo;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MemberControllerServlet
 */
@WebServlet("/MemberControllerServlet")
public class MemberControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDbUtil memberDbUtil;
	
	@Resource(name="jdbc/web_member_tracker")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our member db util ... and pass in the conn pool / datasource
		try {
			memberDbUtil = new MemberDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");
			
			// if the command is missing, then default to listing members
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				listMembers(request, response);
				break;
				
			case "ADD":
				addMember(request, response);
				break;
				
			case "LOAD":
				loadMember(request, response);
				break;
				
			case "UPDATE":
				updateMember(request, response);
				break;
			
			case "DELETE":
				deleteMember(request, response);
				break;
				
			default:
				listMembers(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	private void deleteMember(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read member id from form data
		String theMemberId = request.getParameter("memberId");
		
		// delete member from database
		memberDbUtil.deleteMember(theMemberId);
		
		// send them back to "list members" page
		listMembers(request, response);
	}

	private void updateMember(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read member info from form data
		int id = Integer.parseInt(request.getParameter("memberId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		// create a new member object
		Member theMember = new Member(id, firstName, lastName, email);
		
		// perform update on database
		memberDbUtil.updateMember(theMember);
		
		// send them back to the "list members" page
		listMembers(request, response);
		
	}

	private void loadMember(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// read member id from form data
		String theMemberId = request.getParameter("memberId");
		
		// get member from database (db util)
		Member theMember = memberDbUtil.getMember(theMemberId);
		
		// place member in the request attribute
		request.setAttribute("THE_MEMBER", theMember);
		
		// send to jsp page: update-member-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/update-member-form.jsp");
		dispatcher.forward(request, response);		
	}

	private void addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// read member info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");		
		
		// create a new member object
		Member theMember = new Member(firstName, lastName, email);
		
		// add the member to the database
		memberDbUtil.addMember(theMember);
				
		// send back to main page (the member list)
		listMembers(request, response);
	}

	private void listMembers(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// get members from db util
		List<Member> members = memberDbUtil.getMembers();
		
		// add members to the request
		request.setAttribute("MEMBER_LIST", members);
		
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-members.jsp");
		dispatcher.forward(request, response);
	}

}













