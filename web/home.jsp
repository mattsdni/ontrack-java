<jsp:include page="header.jsp" />

<h1>Welcome Back <%= session.getAttribute("name") %></h1>


<ul class="collapsible" data-collapsible="accordion">
    <li>
        <div class="collapsible-header"><i class="material-icons">filter_drama</i>Create a Schedule</div>
        <div class="collapsible-body">
            <p>This will have button to create schedule. </p>
        </div>
    </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">place</i>View Schedule</div>
        <div class="collapsible-body"><p>This will list the names of previously made schdules.</p></div>
    </li>
    <li>
        <div class="collapsible-header"><i class="material-icons">place</i>Add an advisor</div>
        <div class="collapsible-body">
            <jsp:include page="list_all_advisors.jsp" />
        </div>
    </li>
</ul>



<jsp:include page="footer.jsp" />