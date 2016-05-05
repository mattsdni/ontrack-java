<%@ page import="java.sql.*" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>

<%
    if(myUtil.getConn() == null){
        myUtil.openDB();
    }
    ResultSet r = myUtil.getAllAdvisors();
%>
<table border="1" cellpadding="5">
    <tr> <th>Advisor Name</th> </tr>
    <% while(r.next()){ %>
    <tr>
        <td align="left"><%= r.getString(1)%></td>
            <%} %>
    </tr>
</table>