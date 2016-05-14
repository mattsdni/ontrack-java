<%--
  Created by IntelliJ IDEA.
  User: jordangahan
  Date: 5/5/16
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title></title>
</head>
<body>

<%
    Object target = session.getAttribute("email");
    String email = (String)target;
    String degree = request.getParameter("degree");
    String startingSemester = request.getParameter("startingSemester");
    String startingYear = request.getParameter("startingYear");
    String scheduleName = request.getParameter("scheduleName");
    util.addSchedule(email,degree,startingSemester,startingYear,scheduleName);

    ResultSet rs = util.getScheduleId();
    rs.next();
    String idNumber = rs.getString(1);
    response.sendRedirect("schedule.jsp?id=" + idNumber);
%>


<a href="index.jsp">Back to Main Menu</a>

</body>
</html>