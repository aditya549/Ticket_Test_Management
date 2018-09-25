package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EditProfileDao;
import userbean.Userbean;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Entered into Edit Profile servlet method...");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String empid = request.getParameter("empid");
		String domain = request.getParameter("domain");		
	
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		String email = request.getParameter("email");
		String webmail = request.getParameter("webmail");
		String mobile = request.getParameter("mobile");
		String designation = request.getParameter("designation");
		Userbean user = new Userbean();

		System.out.println("id  "+id);
		System.out.println("id  "+name);
		System.out.println("id  "+empid);
		System.out.println("id  "+domain);
		System.out.println("id  "+password);
		System.out.println("id  "+confirmpassword);
		System.out.println("id  "+email);
		System.out.println("id  "+webmail);
		System.out.println("id  "+mobile);
		System.out.println("id  "+designation);
		
			if ((name !=null) && (empid !=null) && (domain !=null) &&  (password != null) && (confirmpassword !=null) && (email != null) && 
					(webmail !=null) && (mobile != null) && (designation != null)) {
                user.setName(name);
				user.setEmpid(empid);
				user.setDomain(domain);
				user.setPassword(password);
				user.setConfirmpassword(confirmpassword);
				user.setEmail(email);
				user.setWebmail(webmail);
				user.setMobile(Long.parseLong(mobile));
                user.setDesignation(designation);
                System.out.println(name);
				EditProfileDao.insert(user);
				Boolean status = user.isValid();
				System.out.println("Status  "+status);
				if (status) {
					System.out.println(status);
					HttpSession session = request.getSession(true);
					session.setAttribute("session1", user);
					
					response.sendRedirect("EditProfile.jsp");
				} else {
					response.sendRedirect("EditProfile1.jsp");
				}
			}
//			response.sendRedirect("EditProfile.jsp");
		}
}

