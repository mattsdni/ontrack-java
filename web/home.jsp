<jsp:include page="header.jsp" />
<link href="css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<h1>Welcome Back <%= session.getAttribute("name") %></h1>


<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header"><i class="material-icons">today</i>Create a Schedule</div>
        <div class="collapsible-body container">
        <br>
            <form action="addSchedule.jsp" method="get">
                <div class="row">
                    <div class="col s12">
                        <h5>Schedule Name</h5> <input type="text" name="scheduleName" placeholder="Please name your schedule">
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <h5>Choose a degree  </h5>
                        <input name="degree" type="radio" id="test1" value="B.A." class = "radio-input"/>
                        <label for="test1" class = "radio-label">B.A.</label>

                        <input name="degree" type="radio" id="test2" value="B.S." class = "radio-input"/>
                        <label for="test2" class = "radio-label">B.S.</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <h5>Starting Semester </h5>
                        <input name="startingSemester" type="radio" id="test3" value="FALL" class = "radio-input"/>
                        <label for="test3" class = "radio-label">FALL</label>

                        <input name="startingSemester" type="radio" id="test4" value="J-TERM" class = "radio-input"/>
                        <label for="test4" class = "radio-label">J-TERM</label>

                        <input name="startingSemester" type="radio" id="test5" value="SPRING" class = "radio-input"/>
                        <label for="test5" class = "radio-label">SPRING</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col s3">
                        <h5>Starting Year </h5>
                        <input type="text" name="startingYear" placeholder="2000-2099">
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
        <div class="collapsible-header"><i class="material-icons">visibility</i>View Schedule</div>
        <div class="collapsible-body container"><p>This will list the names of previously made schdules.</p></div>
    </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">person_pin</i>Add an advisor</div>
        <div class="collapsible-body container">
            <jsp:include page="list_all_advisors.jsp" />
        </div>
    </li>
</ul>

<jsp:include page="footer.jsp" />