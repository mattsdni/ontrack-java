<%@ page import="java.sql.ResultSet" %>
<jsp:include page="WEB-INF/includes/header.jsp" />
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>

<%
    String id_s = request.getParameter("id");
    ResultSet r = null;
    if (id_s != null)
    {
        try
        {
            int id = Integer.parseInt(id_s);
            r = util.getSchedule(id);
        } catch (Exception e)
        {
            e.printStackTrace();

        }

    }

%>

<link href="css/schedule.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<div class="row">
    <div class="col s12">
        <!-- Main Page Content  -->
        <h1 class="center-text">My Schedule</h1>
    </div>
</div>

<!-- Begin Year Row -->
<div class="row">

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">

        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="fall2016" onclick='highlightSemester("fall2016")'>
                <div class="card-content black-text">
                    <span class="card-title">Fall 2016</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="fall2016courselist">
                        <li>
                            <!--Course label -->
                            <div class="collapsible-header">
                                <div class="collapsible-header-title-left cs">
                                    CSCE 144
                                </div>
                                <div class="collapsible-header-title-right">
                                    Fall/Spring
                                </div>
                            </div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use of
                                    data files. Ethical and social impacts of computing. Prerequisite: four years of
                                    high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">
        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="jterm2017" onclick='highlightSemester("jterm2017")'>
                <div class="card-content black-text">
                    <span class="card-title">J-Term 2017</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="jterm2017courselist">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use of
                                    data files. Ethical and social impacts of computing. Prerequisite: four years of
                                    high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">
        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="spring2017" onclick='highlightSemester("spring2017")'>
                <div class="card-content black-text">
                    <span class="card-title">Spring 2017</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="spring2017courselist">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use
                                    of data files. Ethical and social impacts of computing. Prerequisite: four years
                                    of high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

</div> <!--End Row-->


<!-- Begin Year Row -->
<div class="row">

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">

        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="fall2016" onclick='highlightSemester("fall2016")'>
                <div class="card-content black-text">
                    <span class="card-title">Fall 2016</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="fall2016courselist">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use
                                    of data files. Ethical and social impacts of computing. Prerequisite: four years
                                    of high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">
        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="jterm2017" onclick='highlightSemester("jterm2017")'>
                <div class="card-content black-text">
                    <span class="card-title">J-Term 2017</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="jterm2017courselist">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use of
                                    data files. Ethical and social impacts of computing. Prerequisite: four years of
                                    high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

    <!--Begin Cards Container-->
    <div class="col m12 l4 cards-container">
        <!-- Begin Semester Card -->
        <div class="cardpad">
            <div class="card hoverable z-depth-1 semester" id="spring2017" onclick='highlightSemester("spring2017")'>
                <div class="card-content black-text">
                    <span class="card-title">Spring 2017</span>

                    <ul class="collapsible z-depth-0" data-collapsible="accordion" id="spring2017courselist">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">subtitles</i>CSCE 144<span class="right">Fall/Spring</span></div>
                            <div class="collapsible-body">
                                <h5 class="center-text">Introduction to Computer Science</h5>
                                <p>An introduction to computer science including problem solving, algorithm design,
                                    object-oriented programming, numerical and non-numerical applications, and use of
                                    data files. Ethical and social impacts of computing. Prerequisite: four years of
                                    high school mathematics or MATH 140 or equivalent.</p>

                                <div class="center-btn">
                                    <a class="waves-effect waves-light btn red" onclick='alert("hi")'>Remove</a>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">place</i>Second</div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                        </li>
                    </ul>
                </div> <!-- End Card content-->
                <div class="card-action">
                    <div class="right-text">
                        <p>Total Credits: 17</p>
                    </div>
                </div> <!--End Card Action (Bottom stuff)-->
            </div> <!--End Semester Card-->
        </div> <!--End Card Pad-->
    </div> <!--End Cards Container-->

</div> <!--End Row-->




<jsp:include page="WEB-INF/includes/footer.jsp" />