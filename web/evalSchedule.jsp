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
        LinkedList<String> results = new LinkedList<String>();
        if (id != null)
        {
            results = util.evaluateSchedule(id);
        }
        out.print(JSONValue.toJSONString(results));
    }
    if(request.getMethod().equals("GET"))
    {
%>
        <jsp:include page="header.jsp" flush="true"/>
<%
        String id_s = request.getParameter("id"); //schedule id
        Integer id = Integer.parseInt(id_s);
        LinkedList<String> results = new LinkedList<String>();
        if (id != null)
        {
            results = util.evaluateSchedule(id);
        }
%>
<h1>Evaluate Schedule</h1>
<%
        boolean listFlag;
        for (String s : results)
        {
            if (s.contains("still need to take"))
            {
                listFlag = true;
            }

            out.print(s);
            out.print("<br>");
        }
    }
%>
<table>
    <thead>
    <tr>
        <th data-field="id">Name</th>
        <th data-field="name">Item Name</th>
        <th data-field="price">Item Price</th>
    </tr>
    </thead>

    <tbody>
    <tr>
        <td>Alvin</td>
        <td>Eclair</td>
        <td>$0.87</td>
    </tr>
    <tr>
        <td>Alan</td>
        <td>Jellybean</td>
        <td>$3.76</td>
    </tr>
    <tr>
        <td>Jonathan</td>
        <td>Lollipop</td>
        <td>$7.00</td>
    </tr>
    </tbody>
</table>
