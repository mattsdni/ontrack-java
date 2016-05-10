<jsp:include page="header.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    String name = myUtil.login(request.getParameter("email"), request.getParameter("password"));
    if(name != null)
    {
        session.setAttribute("name", name);
        session.setAttribute("type", "student");
        session.setAttribute("email", request.getParameter("email"));
        response.sendRedirect("home.jsp");
    }
%>

<body>
<div class="row">
    <h3>Invalid Login Credentials</h3>
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
</div>
</body>
<jsp:include page="footer.jsp" />
