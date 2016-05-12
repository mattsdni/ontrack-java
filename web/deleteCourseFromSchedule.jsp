<%--
    Responds to ajax requests from the schedule.jsp page
    Adds the null course to a new semester on the schedule
    effectively adding a blank semester to the schedule.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"/>

<%
    if (request.getMethod().equals("POST"))
    {
        System.out.println("test1");
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String dept = request.getParameter("dept");
        String courseNum = request.getParameter("num");

        out.print(myUtil.deleteCourse(dept,courseNum,id));
        System.out.println("test2");
    }
%>