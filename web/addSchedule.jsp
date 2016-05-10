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
    String target1 = (String)target;
    String target2 = request.getParameter("degree");
    String target3 = request.getParameter("startingSemester");
    String target4 = request.getParameter("startingYear");
    String target5 = request.getParameter("scheduleName");
    util.addSchedule(target1,target2,target3,target4,target5);

    ResultSet rs = util.getScheduleId();
    rs.next();
    String idNumber = rs.getString(1);
    response.sendRedirect("schedule.jsp?id=" + idNumber);
%>


<a href="index.jsp">Back to Main Menu</a>

</body>
</html>