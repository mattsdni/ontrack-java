<%--
  Created by IntelliJ IDEA.
  User: jordangahan
  Date: 5/15/16
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"/>

<%
    if (request.getMethod().equals("POST"))
    {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        out.print(myUtil.deleteSchedule(id));

    }
%>