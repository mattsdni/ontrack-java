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
        String id = request.getParameter("id");
        out.print(myUtil.addNewSemesterToEndOfSchedule(id));
    }
%>