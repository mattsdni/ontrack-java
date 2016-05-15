<%@ page import="java.sql.*" %>
<jsp:useBean id="myUtil" class="ontrack.Utilities" scope="session"></jsp:useBean>
<%
    if(myUtil.getConn() == null){
        myUtil.openDB();
    }
    ResultSet rsAll = myUtil.getAllAdvisors();
    String email = (String) session.getAttribute("email");
    ResultSet rsAdvisor = myUtil.getAdvisor(email);
%>
<%if(rsAdvisor.next()){ %>
    <p id="current-advisor">Your current advisor is <%= rsAdvisor.getString(2) %> ( <%= rsAdvisor.getString(1) %> )</p>
<%} else {%>
    <p>You currently do not have an advisor, please select one</p>
<%}%>
<div class="input-field">
    <form action="add_advisor.jsp" method="post">
        <select name="email">
            <option value="" disabled selected>Choose an advisor</option>
        <% while(rsAll.next()){ %>
            <option value= <%=rsAll.getString(2)%> > <%= rsAll.getString(1)%> </option>
            <%} %>
        </select>
        <p class="left-align">
            <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                <i class="material-icons right">send</i>
            </button>
        </p>
    </form>
</div>