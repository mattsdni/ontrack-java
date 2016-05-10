<%@ page import="java.sql.ResultSet" %>
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


%>

<link href="css/schedule.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<div class="row">
    <div class="col s12">
        <!-- Main Page Content  -->
        <h1 class="center-text">My Schedule</h1>
    </div>
</div>

<%
    out.print(beginYear());

    out.print(semesterCardStart("Fall", "2012"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardEnd());

    out.print(semesterCardStart("J-Term", "2013"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardEnd());

    out.print(semesterCardStart("Spring", "2013"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardCourse("Introduction to Computer Science", "CSCE", "144", 4, "An introduction to computer science including problem solving, algorithm design"));
    out.print(semesterCardEnd());

    out.print(endYear());

%>

<%!
    public String beginYear()
    {
        return "<div class=\"row\">";
    }

    public String endYear()
    {
        return "</div>";
    }

    public String semesterCardStart(String semester, String year)
    {
        return "<div class='col m12 l4 cards-container'>" +
                "<div class=\"cardpad\">" +
                "<div class=\"card hoverable z-depth-1 semester\" id=\"" + semester + year + " \" onclick='highlightSemester(\"" + semester + year + "\")'>" +
                "<div class=\"card-content black-text\">" +
                "<span class=\"card-title\">" + semester + " " + year + "</span>" +
                "<ul class=\"collapsible z-depth-0\" data-collapsible=\"accordion\" id=\"fall2016courselist\">";
    }

    public String semesterCardEnd()
    {
        return "</div>" +
                "<div class=\"card-action\">" +
                "<div class=\"right-text\">" +
                "<p>Total Credits: 17</p>" +
                "</div></div></div></div></div>";
    }
    public String semesterCardCourse(String title, String dept, String course_num, int credits, String description)
    {
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
%>
<%--<!-- Begin Year Row -->--%>
<%--<div class="row">--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>

        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="fall2016" onclick='highlightSemester("fall2016")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">Fall 2016</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="fall2016courselist">--%>
                        <%--<li>--%>
                            <%--<!--Course label -->--%>
                            <%--<div class="collapsible-header">--%>
                                <%--<div class="collapsible-header-title-left cs">--%>
                                    <%--CSCE 144--%>
                                <%--</div>--%>
                                <%--<div class="collapsible-header-title-right">--%>
                                    <%--Fall/Spring--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use of--%>
                                    <%--data files. Ethical and social impacts of computing. Prerequisite: four years of--%>
                                    <%--high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>
        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="jterm2017" onclick='highlightSemester("jterm2017")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">J-Term 2017</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="jterm2017courselist">--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use of--%>
                                    <%--data files. Ethical and social impacts of computing. Prerequisite: four years of--%>
                                    <%--high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>
        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="spring2017" onclick='highlightSemester("spring2017")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">Spring 2017</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="spring2017courselist">--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use--%>
                                    <%--of data files. Ethical and social impacts of computing. Prerequisite: four years--%>
                                    <%--of high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

<%--</div> <!--End Row-->--%>


<%--<!-- Begin Year Row -->--%>
<%--<div class="row">--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>

        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="fall2016" onclick='highlightSemester("fall2016")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">Fall 2016</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="fall2016courselist">--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use--%>
                                    <%--of data files. Ethical and social impacts of computing. Prerequisite: four years--%>
                                    <%--of high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>
        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="jterm2017" onclick='highlightSemester("jterm2017")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">J-Term 2017</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="jterm2017courselist">--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use of--%>
                                    <%--data files. Ethical and social impacts of computing. Prerequisite: four years of--%>
                                    <%--high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

    <%--<!--Begin Cards Container-->--%>
    <%--<div class="col m12 l4 cards-container">--%>
        <%--<!-- Begin Semester Card -->--%>
        <%--<div class="cardpad">--%>
            <%--<div class="card hoverable z-depth-1 semester" id="spring2017" onclick='highlightSemester("spring2017")'>--%>
                <%--<div class="card-content black-text">--%>
                    <%--<span class="card-title">Spring 2017</span>--%>

                    <%--<ul class="collapsible z-depth-0" data-collapsible="accordion" id="spring2017courselist">--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>--%>
                            <%--<div class="collapsible-body">--%>
                                <%--<h5 class="center-text">Introduction to Computer Science</h5>--%>
                                <%--<p>An introduction to computer science including problem solving, algorithm design,--%>
                                    <%--object-oriented programming, numerical and non-numerical applications, and use of--%>
                                    <%--data files. Ethical and social impacts of computing. Prerequisite: four years of--%>
                                    <%--high school mathematics or MATH 140 or equivalent.</p>--%>

                                <%--<div class="center-btn">--%>
                                    <%--<a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<div class="collapsible-header"><i class="material-icons">place</i>Second</div>--%>
                            <%--<div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</div> <!-- End Card content-->--%>
                <%--<div class="card-action">--%>
                    <%--<div class="right-text">--%>
                        <%--<p>Total Credits: 17</p>--%>
                    <%--</div>--%>
                <%--</div> <!--End Card Action (Bottom stuff)-->--%>
            <%--</div> <!--End Semester Card-->--%>
        <%--</div> <!--End Card Pad-->--%>
    <%--</div> <!--End Cards Container-->--%>

<%--</div> <!--End Row-->--%>




<jsp:include page="footer.jsp" />