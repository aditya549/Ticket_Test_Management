<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Userbean user1 = (Userbean) session.getAttribute("testsession");
	%>
<%

String testcaseid=request.getParameter("testcaseid");
String projectName=request.getParameter("projectname");
String requirementName=request.getParameter("requirementname");
String moduleName=request.getParameter("modulename");


System.out.println(testcaseid);
System.out.println(projectName);
System.out.println(requirementName);
System.out.println(moduleName);



 user1.setProjectName(user1.getProjectName());
 user1.setRequirementName(user1.getRequirementName());
 user1.setModuleName(user1.getModuleName());
 user1.setTestcaseid(testcaseid);
 
 
	
 
 
 
 session.setAttribute("testsession",user1);
 response.sendRedirect("ExecutiveBugReport.jsp");

%>
</body>
</html>