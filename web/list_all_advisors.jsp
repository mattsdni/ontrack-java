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
        <select name="email" id="listOfAdvisors">
            <option value="" disabled selected>Choose an advisor</option>
        <% while(rsAll.next()){ %>
            <option value= <%=rsAll.getString(2)%> > <%= rsAll.getString(1)%> </option>
            <%} %>
        </select>
        <p class="left-align">
            <button class="btn waves-effect waves-light" type="submit" onclick = 'updateAdvisor(document.getElementById("listOfAdvisors").options[document.getElementById("listOfAdvisors").options.selectedIndex].value)' name="action">Submit
                <i class="material-icons right">send</i>
            </button>
        </p>
</div>

<script>

    function updateAdvisor(email)
    {
                $.ajax({
                    type: 'post',
                    url:'add_advisor.jsp',
                    data: {
                        email: email
                    },
                    complete: function (response)
                    {
                        if (response)
                        {
                            var text = response.responseText;
                            console.log(text);
                            //do stuff
                            if (text == null)
                            {
                                //failure
                            }
                            else
                            {
                                document.getElementById('current-advisor').innerHTML=text;
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

</script>