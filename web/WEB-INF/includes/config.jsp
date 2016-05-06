<jsp:include page="functions.jsp" />
<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/")+1);

    if (pageName.contains("index.jsp"))
    {
        if (session.getAttribute("email") != null)
        {
            response.sendRedirect("home.jsp");
        }
    }
    if (!(pageName.contains("login.jsp") || pageName.contains("register.jsp") || pageName.contains("logout.jsp")))
    {
        if (session.getAttribute("email") == null)
            response.sendRedirect("index.jsp");
    }
%>