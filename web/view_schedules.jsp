<%@ page import="java.sql.*" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    if(myUtil.getConn() == null){
        myUtil.openDB();
    }
    String email = (String) session.getAttribute("email");
    ResultSet rs = myUtil.getSchedulesForStudent(email);
%>
<div class = "collection">
    <%if(rs == null){ %>
        <p>You currently don't have any schedules</p>
    <%} else {%>
        <% while(rs.next()){ %>
            <a href= <%= "/schedule.jsp?id=" + rs.getString(1) %> class = "collection-item"> <%= rs.getString(2)%> </a>
        <%} %>
    <%}%>
</div>