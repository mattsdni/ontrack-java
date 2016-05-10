<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
The passed in email was <%= request.getParameter("email") %> <br>

<%
    if(request.getMethod().equals("POST"))
    {
        String advisor_email = request.getParameter("email");
        if (advisor_email != null)
        {
            String student_email = (String) session.getAttribute("email");
            if (util.addAdvisor(student_email, advisor_email) == 1)
            {
                //TODO: advisor has been added
            }
        }
    }
%>

</body>
</html>
