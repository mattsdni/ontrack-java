<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--String uri = request.getRequestURI();--%>
    <%--String pageName = uri.substring(uri.lastIndexOf("/")+1);--%>
    <%--if (pageName.contains("index.jsp"))--%>
    <%--{--%>
        <%--if (session.getAttribute("email") != null)--%>
        <%--{--%>
            <%--response.sendRedirect("home.jsp");--%>
        <%--}--%>
    <%--}--%>
    <%--else if (!(pageName.contains("login.jsp") || pageName.contains("register.jsp") || pageName.contains("logout.jsp")))--%>
    <%--{--%>
        <%--if (session.getAttribute("email") == null)--%>
        <%--{--%>
            <%--RequestDispatcher view = request.getRequestDispatcher("index.jsp");--%>
            <%--view.forward(request, response);--%>
        <%--}--%>
    <%--}--%>
<%--%>--%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>Starter Template - Materialize</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>

<nav class="light-blue lighten-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="index.jsp" class="brand-logo">OnTrack</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="#">Navbar Link</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="#">Navbar Link</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>

<div class="container">