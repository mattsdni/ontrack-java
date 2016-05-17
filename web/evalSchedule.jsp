<%@ page import="java.util.LinkedList" %>
<%@ page import="org.json.simple.*" %><%--
<%--
  This page responds to AJAX requests and returns the
  results of the evaluation
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="util" class="ontrack.Utilities" scope="session"/>
<%
    if(request.getMethod().equals("POST"))
    {
        String id_s = request.getParameter("id"); //schedule id
        Integer id = Integer.parseInt(id_s);
        LinkedList<String> results = new LinkedList<String>();
        if (id != null)
        {
            results = util.evaluateSchedule(id);
        }
        out.print(JSONValue.toJSONString(results));
    }
    if(request.getMethod().equals("GET"))
    {
%>
<jsp:include page="header.jsp" flush="true"/>
<%
    String id_s = request.getParameter("id"); //schedule id
    Integer id = Integer.parseInt(id_s);
    LinkedList<String> results = new LinkedList<String>();
    if (id != null)
    {
        results = util.evaluateSchedule(id);
    }
%>
<h1>Evaluate Schedule</h1>
<%
        String[] p = null;
        for (String s : results)
        {
            if (s.contains("still need to take"))
            {
                out.print("<h5>" + s + "</h5>");
                out.print("<br>");
            }
            else if (s.contains("You have not") || s.contains("You have taken"))
            {
                out.print("<h5>" + s + "</h5>");
                out.print("<br>");
            }
            else
            {
                p = s.split("\n");
                int i = 1;
                out.print("<ul class=\"collection\">");
                for(String x : p) {
                    switch (i) {
                        case 0:
                            i++;
                            if(!x.contains("CSCE") && !x.contains("department"))
                            {
                                out.print("<h5>" + x + "</h5>");
                            }
                            break;
                        case 1:
                            i++;
                            break;
                        default:
                            out.print("<li class=\"collection-item\">" + x + "</li>");
                            i++;
                            break;
                    }
                }

                out.print("</ul>");
            }
        }
    }
%>
<a class="waves-effect waves-light btn" href="schedule.jsp?id=<%=request.getParameter("id")%>">Modify Schedule</a>
<%
if(request.getMethod().equals("GET"))
{
%>
<jsp:include page="footer.jsp" flush="true"/>
<%}%>