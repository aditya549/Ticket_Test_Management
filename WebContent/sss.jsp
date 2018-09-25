<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String password =request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");
if(password.equals("confirmpassword")){

	
}else{

String greetings = "password and cofirmpassword  doesnot match" ;
response.setContentType("text/plain");
response.getWriter().write(greetings);
}

%>
</body>
</html>