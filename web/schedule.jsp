<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<jsp:include page="header.jsp" />
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<%
    ResultSet courses = null;
    int scheduleIdNum = -1;
    try{
        scheduleIdNum = Integer.parseInt(request.getParameter("id"));
        courses = util.getSchedule(scheduleIdNum);
    }catch(Exception e){
    response.sendRedirect("home.jsp");
    }
    String scheduleName = "Untitled Schedule";
    if (scheduleIdNum > 0)
    {
        scheduleName = util.getScheduleNameById(scheduleIdNum);
    }

%>

<link href="css/schedule.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<div class="row">
    <div class="col s12">
        <!-- Main Page Content  -->
        <h1 class="center-text"><%=scheduleName%></h1>
    </div>
</div>
<div id="schedule">
<%
    int rowCount = 0;
    int semester_credits = 0;
    try
    {
        System.out.println("-----new-----");
        courses.next();
        String current_semester = courses.getString("course_semester");
        String prev_semester = current_semester;
        String current_year = courses.getString("course_year");
        int courseCount=0;
        out.print(beginYear(rowCount)); //start a row for first year
        out.print(semesterCardStart(current_semester, current_year));
        courses.previous();
        while (courses.next())
        {
            courseCount++;
            current_semester = courses.getString("course_semester");
            if (current_semester.compareTo(prev_semester) != 0)
            {
                if (current_semester.equals("FALL"))
                {
                    rowCount++;
                    if (prev_semester.equals("J-TERM") || prev_semester.equals("SPRING"))
                    {
                        String tmp_year = ""+(1+(Integer.parseInt(current_year)));
                        out.print(semesterCardEnd(semester_credits, tmp_year, prev_semester));
                    }
                    else
                    {
                        out.print(semesterCardEnd(semester_credits, current_year, prev_semester));
                    }
                    prev_semester = current_semester;
                    semester_credits = 0;
                    out.print(endYear());
                    int year = (Integer.parseInt(current_year));
                    year++;
                    current_year = year+"";
                    out.print(beginYear(rowCount));
                    out.print(semesterCardStart(courses.getString("course_semester"), courses.getString("course_year")));
                }
                else
                {
                    if (prev_semester.equals("J-TERM") || prev_semester.equals("SPRING"))
                    {
                        String tmp_year = ""+(1+(Integer.parseInt(current_year)));
                        out.print(semesterCardEnd(semester_credits, tmp_year, prev_semester));
                    }
                    else
                    {
                        out.print(semesterCardEnd(semester_credits, current_year, prev_semester));
                    }
                    prev_semester = current_semester;
                    semester_credits = 0;
                    out.print(semesterCardStart(courses.getString("course_semester"), courses.getString("course_year")));
                }
            }

            //add course to current semester
            String title = courses.getString("name");
            String dept = courses.getString("department");
            String course_num = courses.getString("course_number");
            int credits = courses.getInt("credits");
            String description = courses.getString("description");
            semester_credits += credits;

            out.print(semesterCardCourse(title, dept, course_num, credits, description, courseCount));
        }
        out.print(semesterCardEnd(semester_credits, current_year, current_semester));

        if (current_semester.equals("SPRING"))
        {
            out.print(endYear());
            rowCount++;
            out.print(beginYear(rowCount));
            out.print(semesterCardStart(util.whichSemesterComesAfter(current_semester), current_year));
            out.print(semesterCardEnd(0, current_year, util.whichSemesterComesAfter(current_semester)));
            out.print(endYear());

        }
        else if (current_semester.equals("J-TERM"))
        {
            out.print(semesterCardStart(util.whichSemesterComesAfter(current_semester), current_year));
            out.print(semesterCardEnd(0, current_year, util.whichSemesterComesAfter(current_semester)));
            out.print(endYear());

        }
        else
        {
            out.print(semesterCardStart(util.whichSemesterComesAfter(current_semester), ""+(1+Integer.parseInt(current_year))));
            out.print(semesterCardEnd(0, ""+(1+Integer.parseInt(current_year)), util.whichSemesterComesAfter(current_semester)));
            out.print(endYear());
        }
    } catch (SQLException e)
    {
        e.printStackTrace();
        out.print(beginYear(rowCount));
        ResultSet scheduleStartData = util.getSemesterAndYearOfSchedule(scheduleIdNum);
        try
        {
            scheduleStartData.next();
        } catch (SQLException e1)
        {
            e1.printStackTrace();
        }
        try
        {
            out.print(semesterCardStart(scheduleStartData.getString(1), scheduleStartData.getString(2)));
        } catch (SQLException e1)
        {
            e1.printStackTrace();
        }
        String s1 = scheduleStartData.getString(2);
        String s2 = scheduleStartData.getString(1);
        System.out.println(s1);
        System.out.println(s2);

        out.print(semesterCardEnd(semester_credits,scheduleStartData.getString(2) , scheduleStartData.getString(1)));
        out.print(endYear());
    }

%>
</div>

<div class="row">
    <div class="col s12 center">
        <a href="evalSchedule.jsp?id=<%=scheduleIdNum%>" class="waves-effect waves-light btn-large">Evaluate Schedule</a>
    </div>
</div>


<%!
    public String beginYear(int rowNum)
    {
        System.out.println("begin year");
        return "<div class=\"row\" id=\"srow" + rowNum + "\">";
    }

    public String endYear()
    {
        System.out.println("end year");
        return "</div>";
    }

    public String semesterCardStart(String semester, String year)
    {
        //System.out.println("semester start");
        return "<div class='col m12 l4 cards-container'>" +
                "<div class=\"cardpad\">" +
                "<div class=\"card hoverable z-depth-1 semester\" id=\"" + semester + year + "\" onclick='highlightSemester(\"" + semester + year + "\")'>" +
                "<div class=\"card-content black-text\">" +
                "<span class=\"card-title\">" + semester + " " + year + "</span>" +
                "<ul class=\"collapsible z-depth-0\" data-collapsible=\"accordion\" id=\"fall2016courselist\">";
    }

    public String semesterCardEnd(int credits, String year, String semester)
    {
        System.out.println("semester end");
        return "</div>" +
                "<div class=\"card-action\">" +
                "<div class=\"row\">" +
                "<div class=\"col s6\" style=\"padding-top: 0.7em;\">" +
                "<!-- Modal Trigger -->\n" +
                "<a onclick=\"setGlobal(\'" + semester +"\', \'" + year + "\')\" id=\""+ semester + "-" + year +"\" class=\"modal-trigger waves-effect waves-light btn\" href=\"#addCourseModal\">" +
                "            <i class=\"material-icons center\">add</i></a>" +
                "</div>" +
                    "<div class=\"col s6 right-text\">" +
                        "<p>Total Credits: " + credits + "</p>" +
                "</div></div></div></div></div></div>";
    }
    public String semesterCardCourse(String title, String dept, String course_num, int credits, String description, int courseId)
    {
        System.out.println("add " + title + " to semester");
        if (dept.equals("null") && course_num.equals("null"))
        {
            return "";
        }
        return "<li id = course" + courseId + ">" +
                "<div class=\"collapsible-header\">" +
                "<div class=\"collapsible-header-title-left cs\">" +
                dept + " " + course_num +
                "</div>" +
                "<div class=\"collapsible-header-title-right\">" +
                "Fall/Spring" +
                "</div>" +
                "</div>" +
                "<div class=\"collapsible-body\">" +
                "<h5 class=\"center-text\">" + title + "</h5>" +
                "<p>" + description +"</p>" +
                "<div class=\"center-btn\">" +
                "<a class=\"waves-effect waves-light btn red\" onclick='deleteCourse(this.parentElement.parentElement.parentElement.id)'>Remove</a>" +
                "</div>" +
                "</div>" +
                "</li>";
    }

    public String addSemesterButton()
    {
        return  "<div class=\"col m12 l4 center\" style=\"padding-top: 4rem;\">" +
                "<button class=\"btn waves-effect waves-light btn-xlarge\" type=\"button\" onclick=\"addNewSemester()\" name=\"action\">" +
                "<i class=\"material-icons center\">add</i>" +
                "</button>" +
                "</div>";
    }
%>

<script>
    function addNewSemester()
    {
        console.log("hiiii");
        $.ajax({
            type: 'post',
            url:'addNewSemesterToCourse.jsp',
            data: {
                id: getParameterByName("id")
            },
            complete: function (response)
            {
                if (response)
                {
                    var text = response.responseText;
                    //do stuff
                    if (text == null)
                    {
                        //failure
                    }
                    else
                    {
                        var row_nodes = document.querySelectorAll('*[id^="srow"]');
                        var id = row_nodes[row_nodes.length-1].id;
                        var rowNum = id.substring(4);
                        rowNum++;

                        //add new semester card (a blank one)
                        //if added to fall, add a new year row, then a semester
                        if (text == "FALL")
                        {
                            var schedule = document.getElementById("schedule");
                            var d = document.createElement('div');
                            d.className += "row";
                            d.id = "row" + (rowNum+1);
                            schedule.appendChild(d);
                        }
                        var blank_card = document.createElement('div');
                        var row = document.getElementById((rowNum+1)+"");
                        //TODO: add the content to the innerHTML of the card then append it to the row or soemthing

                    }
                }
            }
        });
    }

    function deleteCourse(courseId)
    {
        courseKey = document.getElementById(courseId).firstChild.firstChild.innerHTML.split(" "),
        $.ajax({
            type: 'post',
            url:'deleteCourseFromSchedule.jsp',
            data: {
                id: getParameterByName("id"),
                dept:courseKey[0],
                num:courseKey[1]
            },
            complete: function (response)
            {
                if (response)
                {
                    var text = response.responseText;
                    //do stuff
                    if (text == null)
                    {
                        //failure
                    }
                    else
                    {
                        console.log(courseId);
                        $('#'+courseId).remove();
                    }
                }
            }
        });
    }

    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    function removeCourseFromSchedule(courseId){
        console.log(courseId);
        $('#'+courseId).remove();
    }

    function setGlobal(sem, yr)
    {
        semester = sem;
        year = yr;
    }


</script>

<jsp:include page="/views/modals/addToSemesterModal.jsp" />

<jsp:include page="footer.jsp" />