<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>
<%
    if(request.getMethod().equals("POST"))
    {
        String advisor_email = request.getParameter("email");
        if (advisor_email != null)
        {
            String student_email = (String) session.getAttribute("email");
            if (util.addAdvisor(student_email, advisor_email) == 1)
            {
                response.sendRedirect("home.jsp");
            }
        }
    }
%>
