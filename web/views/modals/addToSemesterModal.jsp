<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>

<%
    LinkedList<String[]> courses = myUtil.getAllCourses();
%>

<!-- Modal Trigger -->
<a class="modal-trigger waves-effect waves-light btn" href="#addCourseModal">Modal</a>

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
                <td><%=s[0]+s[1]%></td>
                <td><%=s[2]%></td>
                <td>Credits: <%=s[3]%></td>
                <td><a class="btn waves-effect waves-light">+</a></td>
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

</style>

