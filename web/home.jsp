<jsp:include page="header.jsp" />
<link href="css/home.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<h1>Welcome Back <%= session.getAttribute("name") %></h1>


<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header"><i class="material-icons">filter_drama</i>Create a Schedule</div>
        <div class="collapsible-body container">

            <h2>Create a Schedule </h2>
            <form action="addSchedule.jsp" method="get">


                <h5>Schedule Name</h5> <input type="text" name="scheduleName" placeholder="Please name your schedule">

                    <p>
                        <h5>Choose a degree  </h5>
                        <input name="degree" type="radio" id="test1" value="B.A." class = "radio-input"/>
                        <label for="test1" class = "radio-label">B.A.</label>

                        <input name="degree" type="radio" id="test2" value="B.S." class = "radio-input"/>
                        <label for="test2" class = "radio-label">B.S.</label>
                    </p>

                    <p>
                    <h5>Starting Semester </h5>
                        <input name="startingSemester" type="radio" id="test3" value="FALL" class = "radio-input"/>
                        <label for="test3" class = "radio-label">FALL</label>

                        <input name="startingSemester" type="radio" id="test4" value="J-TERM" class = "radio-input"/>
                        <label for="test4" class = "radio-label">J-TERM</label>

                        <input name="startingSemester" type="radio" id="test5" value="SPRING" class = "radio-input"/>
                        <label for="test5" class = "radio-label">SPRING</label>
                    </p>

                    <p>
                <h5>Starting Year </h5>
                        <input name="startingYear" type="radio" id="test6" value="2010" class = "radio-input"/>
                        <label for="test6" class = "radio-label">2010</label>

                        <input name="startingYear" type="radio" id="test7" value="2011" class = "radio-input"/>
                        <label for="test7" class = "radio-label">2011</label>

                        <input name="startingYear" type="radio" id="test8" value="2012" class = "radio-input"/>
                        <label for="test8" class = "radio-label">2012</label>

                        <input name="startingYear" type="radio" id="test9" value="2013" class = "radio-input"/>
                        <label for="test9" class = "radio-label">2013</label>

                        <input name="startingYear" type="radio" id="test10" value="2014" class = "radio-input"/>
                        <label for="test10" class = "radio-label">2014</label>

                        <input name="startingYear" type="radio" id="test11" value="2015" class = "radio-input"/>
                        <label for="test11" class = "radio-label">2015</label>

                        <input name="startingYear" type="radio" id="test12" value="2016" class = "radio-input"/>
                        <label for="test12" class = "radio-label">2016</label>

                        <input name="startingYear" type="radio" id="test13" value="2017" class = "radio-input"/>
                        <label for="test13" class = "radio-label">2017</label>

                        <input name="startingYear" type="radio" id="test14" value="2018" class = "radio-input"/>
                        <label for="test14" class = "radio-label">2018</label>

                        <input name="startingYear" type="radio" id="test15" value="2019" class = "radio-input"/>
                        <label for="test15" class = "radio-label">2019</label>

                        <input name="startingYear" type="radio" id="test16" value="2020" class = "radio-input"/>
                        <label for="test16" class = "radio-label">2020</label>

                        <input name="startingYear" type="radio" id="test17" value="2021" class = "radio-input"/>
                        <label for="test17" class = "radio-label">2021</label>

                        <input name="startingYear" type="radio" id="test18" value="2022" class = "radio-input"/>
                        <label for="test18" class = "radio-label">2022</label>

                        <input name="startingYear" type="radio" id="test19" value="2023" class = "radio-input"/>
                        <label for="test19" class = "radio-label">2023</label>

                        <input name="startingYear" type="radio" id="test20" value="2024" class = "radio-input"/>
                        <label for="test20" class = "radio-label">2024</label>

                        <input name="startingYear" type="radio" id="test21" value="2025" class = "radio-input"/>
                        <label for="test21" class = "radio-label">2025</label>

                        <input name="startingYear" type="radio" id="test22" value="2026" class = "radio-input"/>
                        <label for="test22" class = "radio-label">2026</label>

                        <input name="startingYear" type="radio" id="test23" value="2027" class = "radio-input"/>
                        <label for="test23" class = "radio-label">2027</label>

                        <input name="startingYear" type="radio" id="test24" value="2028" class = "radio-input"/>
                        <label for="test24" class = "radio-label">2028</label>

                        <input name="startingYear" type="radio" id="test25" value="2029" class = "radio-input"/>
                        <label for="test25" class = "radio-label">2029</label>

                    </p>

                <p class="left-align">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </p>
            </form>


        </div>
    </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">place</i>View Schedule</div>
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