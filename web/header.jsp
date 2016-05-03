<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="nav-wrapper container"><a id="logo-container" href="index.html" class="brand-logo">OnTrack</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="schedule.html">Navbar Link</a></li>
        </ul>

        <ul id="nav-mobile" class="side-nav">
            <li><a href="schedule.html">Navbar Link</a></li>
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
<div class="section no-pad-bot" id="index-banner">
    <div class="container">
        <br><br>
        <h1 class="header center">Take Control</h1>
        <div class="row center">
            <h5 class="header col s12 light">OnTrack is a modern tool that helps students and advisors plan for a college degree</h5>
        </div>
        <div class="row center">
            <a href="#login" id="download-button" class="btn-large waves-effect waves-light btn modal-trigger light-blue">Login</a>
            <a href="#signup" id="download-button2" class="btn-large waves-effect waves-light btn modal-trigger light-blue">Sign up</a>
        </div>
        <br><br>

    </div>
</div>

<!-- Modal Structure -->
<div id="login" class="modal">
    <div class="modal-content">
        <h4 class="valign">Login</h4>
        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate">
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="pass" type="password" class="validate">
                        <label for="pass">Password</label>
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
                            <button class="btn btn-large waves-effect waves-light" type="button" name="action">Login</button>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal Structure -->
<div id="signup" class="modal">
    <div class="modal-content">
        <h4 class="valign">Create a New Account</h4>
        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate">
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="pass" type="password" class="validate">
                        <label for="pass">Password</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="confirmpass" type="password" class="validate">
                        <label for="confirmpass">Confirm Password</label>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="row">
                    <div class="col m12">
                        <p class="right-align">
                            <button class="btn btn-large waves-effect waves-light" type="button" name="action">Sign Up!</button>
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="container">