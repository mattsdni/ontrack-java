<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<jsp:include page="header.jsp" />
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<%
    ResultSet courses = null;
    try{
        int scheduleIdNum = Integer.parseInt(request.getParameter("id"));
        courses = util.getSchedule(scheduleIdNum);
    }catch(Exception e){
    response.sendRedirect("home.jsp");
    }
    //util.printResultSet(courses);


%>

<link href="css/schedule.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<div class="row">
    <div class="col s12">
        <!-- Main Page Content  -->
        <h1 class="center-text">My Schedule</h1>
    </div>
</div>

<%
    try
    {
        System.out.println("-----new-----");
        courses.next();
        String current_semester = courses.getString("course_semester");
        String prev_semester = current_semester;
        String current_year = courses.getString("course_year");
        out.print(beginYear()); //start a row for first year
        out.print(semesterCardStart(current_semester, current_year));
        courses.previous();
        while (courses.next())
        {
            current_semester = courses.getString("course_semester");
            if (current_semester.compareTo(prev_semester) != 0)
            {
                if (current_semester.equals("FALL"))
                {
                    prev_semester = current_semester;
                    out.print(semesterCardEnd());
                    out.print(endYear());
                    out.print(beginYear());
                    out.print(semesterCardStart(courses.getString("course_semester"), courses.getString("course_year")));
                }
                else
                {
                    prev_semester = current_semester;
                    out.print(semesterCardEnd());
                    out.print(semesterCardStart(courses.getString("course_semester"), courses.getString("course_year")));
                }
            }

            //add course to current semester
            String title = courses.getString("name");
            String dept = courses.getString("department");
            String course_num = courses.getString("course_number");
            int credits = courses.getInt("credits");
            String description = courses.getString("description");

            out.print(semesterCardCourse(title, dept, course_num, credits, description));
        }
        out.print(semesterCardEnd());
        out.print(addSemesterButton());
        out.print(endYear());
    } catch (SQLException e)
    {
        e.printStackTrace();
        out.print("<h1>Your Schedule is empty.</h1>");
    }

%>



<%!
    public String beginYear()
    {
        System.out.println("begin year");
        return "<div class=\"row\">";
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
                "<div class=\"card hoverable z-depth-1 semester\" id=\"" + semester + year + " \" onclick='highlightSemester(\"" + semester + year + "\")'>" +
                "<div class=\"card-content black-text\">" +
                "<span class=\"card-title\">" + semester + " " + year + "</span>" +
                "<ul class=\"collapsible z-depth-0\" data-collapsible=\"accordion\" id=\"fall2016courselist\">";
    }

    public String semesterCardEnd()
    {
        System.out.println("semester end");
        return "</div>" +
                "<div class=\"card-action\">" +
                "<div class=\"row\">" +
                "<div class=\"col s6\" style=\"padding-top: 0.7em;\">" +
                "<button class=\"btn waves-effect waves-light\" type=\"button\" name=\"action\">" +
                "            <i class=\"material-icons center\">add</i>" +
                "        </button>" +
                "</div>" +
                    "<div class=\"col s6 right-text\">" +
                        "<p>Total Credits: 17</p>" +
                "</div></div></div></div></div></div>";
    }
    public String semesterCardCourse(String title, String dept, String course_num, int credits, String description)
    {
        System.out.println("add " + title + " to semester");
        return "<li>" +
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
                "<a class=\"waves-effect waves-light btn red\" onclick='alert(\"hi\")'>Remove</a>" +
                "</div>" +
                "</div>" +
                "</li>";
    }

    public String addSemesterButton()
    {
        return  "<div class=\"col m12 l4 center\" style=\"padding-top: 4rem;\">" +
                "<button class=\"btn waves-effect waves-light btn-xlarge\" type=\"button\" name=\"action\">" +
                "<i class=\"material-icons center\">add</i>" +
                "</button>" +
                "</div>";
    }
%>

<jsp:include page="footer.jsp" />