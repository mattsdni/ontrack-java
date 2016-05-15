<%@ page import="java.sql.*" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    if(myUtil.getConn() == null){
        myUtil.openDB();
    }
    String email = (String) session.getAttribute("email");
    ResultSet rs = myUtil.getSchedulesForStudent(email);
%>
    <%if(!rs.next()){ %>
        <p>You currently don't have any schedules</p>
    <%} else {%>
        <%rs.beforeFirst();%>
        <div class = "collection">
        <% while(rs.next()){ %>
            <div class="row" id="sched<%=rs.getString(1)%>">
                <div class="col s10">
                    <a href= <%= "/schedule.jsp?id=" + rs.getString(1) %> class="collection-item"> <%= rs.getString(2)%> </a>
                </div>
                <div class="col s2">
                    <a class="waves-effect waves-light btn red" style="margin-top: 2px;" onclick="deleteCourse(<%=rs.getString(1)%>)">Delete</a>
                </div>
            </div>
        <%} %>
        </div>
    <%}%>

<script>
    function deleteCourse(scheduleId)
    {
                $.ajax({
                    type: 'post',
                    url:'deleteSchedule.jsp',
                    data: {
                        id: scheduleId
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
                                console.log(scheduleId);
                                $('#'+'sched'+scheduleId).remove();
                            }
                        }
                    }
                });
    }
</script>