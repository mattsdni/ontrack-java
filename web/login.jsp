<%--
  Created by IntelliJ IDEA.
  User: joseph
  Date: 5/10/16
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    boolean test = myUtil.login(request.getParameter("email"), request.getParameter("password"));
    if(test)
    {
        session.setAttribute("email", request.getParameter("email"));
        response.sendRedirect("home.jsp");
    }
%>
<%=test%>
<br>
<br>
<body>
<form class="col s12" action="login.jsp" method="post">
    <div class="row">
        <div class="input-field col s12">
            <input id="email-login" type="email" name="email" class="validate">
            <label for="email-login">Email</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="pass-login" type="password" name="password" class="validate">
            <label for="pass-login">Password</label>
        </div>
    </div>
    <div class="row">
        <div class="col s12">
            <p>
                <input type="checkbox" id="remember">
                <label for="remember">Remember me</label>
            </p>
        </div>
    </div>
    <div class="divider"></div>
    <div class="row">
        <div class="col m12">
            <p class="right-align">
                <button class="btn btn-large waves-effect waves-light" type="submit">Login</button>
            </p>
        </div>
    </div>
</form>
</body>
