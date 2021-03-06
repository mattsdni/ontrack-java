<jsp:include page="header.jsp" />
<link href="css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<h1>Welcome Back <%= session.getAttribute("name") %></h1>


<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header"><i class="material-icons">today</i>Create a Schedule</div>
        <div class="collapsible-body container">
        <br>
            <form action="addSchedule.jsp" name="create_schedule" method="get">
                <div class="row">
                    <div class="col s12">
                        <h5>Schedule Name</h5> <input type="text" name="scheduleName" maxlength="128" placeholder="Please name your schedule" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <h5>Choose a degree  </h5>
                        <input name="degree" type="radio" id="test1" value="B.A." class = "radio-input" required/>
                        <label for="test1" class = "radio-label">B.A.</label>

                        <input name="degree" type="radio" id="test2" value="B.S." class = "radio-input" required/>
                        <label for="test2" class = "radio-label">B.S.</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <h5>Starting Semester </h5>
                        <input name="startingSemester" type="radio" id="test3" value="FALL" class = "radio-input" required/>
                        <label for="test3" class = "radio-label">FALL</label>

                        <input name="startingSemester" type="radio" id="test4" value="J-TERM" class = "radio-input" required/>
                        <label for="test4" class = "radio-label">J-TERM</label>

                        <input name="startingSemester" type="radio" id="test5" value="SPRING" class = "radio-input" required/>
                        <label for="test5" class = "radio-label">SPRING</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <h5>Starting Year </h5>
                        <input type="number" size="4" min="2000" max="2099" name="startingYear" placeholder="2000-2099" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">visibility</i>View Schedules</div>
        <div class="collapsible-body container">
            <jsp:include page="view_schedules.jsp" />
        </div>
    </li>
    <li>
        <div class="collapsible-header" id="advisor-label"><i class="material-icons">person_pin</i>Add an advisor</div>
        <div class="collapsible-body container">
            <jsp:include page="list_all_advisors.jsp" />
        </div>
    </li>
</ul>
<jsp:include page="footer.jsp" />