<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %><%--
    Responds to ajax requests from the schedule.jsp page
    Adds the null course to a new semester on the schedule
    effectively adding a blank semester to the schedule.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"/>

<%
    if (request.getMethod().equals("POST"))
    {
        System.out.println(request.getParameter("schedule_id"));
        myUtil.addCourseToSchedule(request.getParameter("schedule_id"),
                request.getParameter("department"),
                request.getParameter("course_number"),
                request.getParameter("course_semester"),
                request.getParameter("course_year"));

        out.print(JSONObject.toJSONString(myUtil.getCourseInfo(
                request.getParameter("department"), request.getParameter("course_number"))));
    }
%>