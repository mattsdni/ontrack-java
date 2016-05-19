<%@ page import="java.util.LinkedList" %>
<%--
  This page registers the user
--%>
<jsp:include page="header.jsp" />
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
        }

    }

%>
<h3>That email address is already in use</h3>
<form class="col s12" action="register.jsp" method="post">
    <div class="row">
        <div class="input-field col s12">
            <input id="name-register" type="text" name="name">
            <label for="name-register">Name</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="email-register" type="email" class="validate" name="email">
            <label for="email-register">Email</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="pass-register" type="password" class="validate" name="password">
            <label for="pass-register">Password</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="confirmpass" type="password" class="validate" name="confirm-password">
            <label for="confirmpass">Confirm Password</label>
        </div>
    </div>
    <div class="divider"></div>
    <div class="row">
        <div class="col m12">
            <p class="right-align">
                <button class="btn btn-large waves-effect waves-light" type="submit">Signup</button>
            </p>
        </div>
    </div>
</form>

<jsp:include page="footer.jsp" />