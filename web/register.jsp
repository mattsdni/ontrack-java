<%@ page import="java.util.LinkedList" %>
<%--
  This page responds to AJAX requests and returns the project numbers
  that a specific emplyee works on
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<%


    if(request.getMethod().equals("POST"))
    {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null && password != null)
        {
            if (util.addStudentAccount(name, password, email) == 1)
            {
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("type", "student"); // TODO: set this dynamically
                response.sendRedirect("home.jsp");
            }
            else
            {
                //email address already in use
            }
        }

    }

%>
