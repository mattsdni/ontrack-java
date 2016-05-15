<jsp:include page="header.jsp" />
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
  Cookie[] cookies = request.getCookies();     // request is an instance of type
  //HttpServletRequest

  for(int i = 0; i < cookies.length; i++)
  {
    Cookie c = cookies[i];
    if (c.getName().equals("email"))
    {
      session.setAttribute("email", c.getValue());
      session.setAttribute("type", "student");
      session.setAttribute("name", myUtil.getStudentName(c.getValue()));
      response.sendRedirect("home.jsp");
      break;
    }
  }
%>

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
              <input type="checkbox" id="remember" name="remember">
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
  </div>
</div>


<!-- Modal Structure -->
<div id="signup" class="modal">
  <div class="modal-content">
    <h4 class="valign">Create a New Account</h4>
    <div class="row">
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
    </div>
  </div>
</div>


<div class="container">

<div class="section">

    <!--   Icon Section   -->
    <div class="row">
      <div class="col s12 m4">
        <div class="icon-block">
          <h2 class="center light-blue-text"><i class="material-icons">navigation</i></h2>
          <h5 class="center">Plan your degree</h5>

          <p class="light">Quis graece putant id nam, et sit argumentum intellegam. Sea posse intellegebat ei, pri liber scribentur id. Sea no delectus constituam. Ad duo primis labore, an probo corpora has.</p>
        </div>
      </div>
      <div class="col s12 m4">
        <div class="icon-block">
          <h2 class="center light-blue-text"><i class="material-icons">group</i></h2>
          <h5 class="center">Connect with your advisor</h5>

          <p class="light">Veniam nostro id sit, eum decore soluta intellegam no, per no possit deserunt posidonium. Dico assum et nec, epicurei consequuntur ius ut. Ne aperiri consetetur vim. Purto novum eu pri, ad vero intellegat quo. </p>
        </div>
      </div>
      <div class="col s12 m4">
        <div class="icon-block">
          <h2 class="center light-blue-text"><i class="material-icons">trending_up</i></h2>
          <h5 class="center">Stay on track</h5>

          <p class="light">Mel ut labore conclusionemque, graeci doming eligendi ad usu. Quod sonet cu vix, cum ei purto petentium vulputate, qui alii aliquando te. Mea at eirmod fabulas definitiones. Pri ut corpora mentitum elaboraret. </p>
        </div>
      </div>
    </div>

  </div>
  <br><br>

  <div class="section">

  </div>

<jsp:include page="footer.jsp" />