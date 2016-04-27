<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
Data From the Complex Form

Name	<%=request.getParameter("name_field")%> <br>
Address	<%=request.getParameter("addr_field")%> <br>
City	<%=request.getParameter("city_field")%> <br>
State	<%=request.getParameter("state_field")%> <br>
Zip	<%=request.getParameter("zip_field")%> <br>
Your favorite color is <% String favColor = request.getParameter("fav_color"); if (favColor == null) out.println("unknown."); else if (favColor.equals("r")) out.println("red."); else if (favColor.equals("g")) out.println("green."); else if (favColor.equals("b")) out.println("blue."); else if (favColor.equals("y")) out.println("yellow."); %>
Your pet's name is <%=request.getParameter("pet_name")%>.
Your pizza will contain: <% String toppings[] = request.getParameterValues("toppings"); if (toppings != null) { for (int i = 0; i < toppings.length - 1; i++) out.println(toppings[i] + ","); out.println(toppings[toppings.length - 1] + "."); } else { out.println("nothing extra!"); } %>
Your comments:
<%=request.getParameter("comments")%>