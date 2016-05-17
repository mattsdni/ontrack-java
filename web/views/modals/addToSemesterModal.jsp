<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"/>

<%
    LinkedList<String[]> courses = myUtil.getAllCourses();
%>



<!-- Modal Structure -->
<div id="addCourseModal" class="modal modal-fixed-footer">
        <div class="container"><h4 class="center">Add course to semester</h4></div>
    <div class="row"><div class="col s2"><h5>Search: </h5></div><label class="col s6"><input id="search" type="text"></label></div>
    <table>
        <tbody overflow:scroll>
            <%
                for (String[] s : courses) {
                    //department, course_number, name, credits
            %>
            <tr>
                <td><%=s[0] + "-" + s[1]%></td>
                <td><%=s[2]%></td>
                <td>Credits: <%=s[3]%></td>
                <td><a onclick="addCourse(this)" id="addCourse" class="btn waves-effect waves-light"><i class="material-icons">add</i></a></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
    </div>
</div>
<script>
    window.onload = function () {
        var $cells = $("td");

        $("#search").keyup(function() {
            var val = $.trim(this.value).toUpperCase();
            if (val === "")
                $cells.parent().show();
            else {
                $cells.parent().hide();
                $cells.filter(function () {
                    return -1 != $(this).text().toUpperCase().indexOf(val);
                }).parent().show();
            }
        });
    }

    function addCourse(arg){
        var info = arg.parentElement.parentElement.getElementsByTagName("td")[0].innerHTML;
        var x = info.split('-');
        var department = x[0];
        var number = x[1];
        $.ajax({
            type: 'post',
            url:'addCourseToSchedule.jsp',
            data: {
                schedule_id: getParameterByName("id"),
                department: department,
                course_number: number,
                course_semester: semester,
                course_year: year
            },
            complete: function (response)
            {
                if (response)
                {
                    var text = response.responseText;
                    console.log(text);
                    var map = JSON.parse(text);
                    addClassToSemester(semester+year+'courselist', map['name'], map['department'], number,
                            map['credits'], map['description'], 'course'+(Math.floor(Math.random() * 999999) + 99  ));
                }
            }
        });

        console.log(arg);
        arg.classList.add("disabled");

    }

</script>
<style>
    table {
    }
    tbody {
        height: 50vh;
        overflow: auto;
        width:auto;
    }
    td {
        padding: 1vh 3vh;
        width:auto;
    }

    thead > tr, tbody{
        display:block;
    }

    .modal-footer
    {
        z-index: 99999;
    }

    #addCourseModal {
        width: 50vw;
        min-width: 591px;
    }

</style>

