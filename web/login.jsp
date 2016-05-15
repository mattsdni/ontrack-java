<jsp:include page="header.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    String email = null;
    String name = myUtil.login(request.getParameter("email"), request.getParameter("password"));
    if(name != null)
    {
        if(request.getParameter("remember").equals("on"))
        {
            Cookie c = new Cookie("email", request.getParameter("email"));
            c.setMaxAge(24*60*30);
            response.addCookie(c);  // response is an instance of type HttpServletReponse
        }
        session.setAttribute("name", name);
        session.setAttribute("type", "student");
        session.setAttribute("email", request.getParameter("email"));
        response.sendRedirect("home.jsp");
    }
    else {
        email = request.getParameter("email");
        if(email == null)
            email = "";
    }
%>

<body>
<div class="row">
    <h3>Invalid Login Credentials</h3>
<form class="col s12" action="login.jsp" method="post">
    <div class="row">
        <div class="input-field col s12">
            <input id="email-login" type="email" name="email" class="validate" value="<%=email%>">
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
