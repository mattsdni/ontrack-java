<%--
    Responds to ajax requests from the
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>
<%
    if(request.getMethod().equals("POST"))
    {
        String advisor_email = request.getParameter("email");
        String student_email = (String) session.getAttribute("email");
        util.addAdvisor(student_email, advisor_email);
        ResultSet rs = util.getAdvisor(student_email);
        rs.next();
        String advisor_name = rs.getString(2);

        out.print("Your current advisor is " + advisor_name + " (" + advisor_email + ")");
    }
%>
