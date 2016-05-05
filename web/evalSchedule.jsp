<%@ page import="java.util.LinkedList" %>
<%@ page import="org.json.simple.*" %><%--

<%--
  This page responds to AJAX requests and returns the
  results of the evaluation
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<%
    if(request.getMethod().equals("POST"))
    {
        String id_s = request.getParameter("id"); //schedule id
        Integer id = Integer.parseInt(id_s);
        LinkedList<String> results = new LinkedList<>();
        if (id != null)
        {
            results = util.evaluateSchedule(id);
        }
        out.print(JSONValue.toJSONString(results));
    }
%>
