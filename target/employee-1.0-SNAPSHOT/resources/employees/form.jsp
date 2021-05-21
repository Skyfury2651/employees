<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="entity.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employee employee = (Employee) request.getAttribute("employee");
    if (employee == null) {
        employee = new Employee("", "", new Date(System.currentTimeMillis()), "", "");
    }
    HashMap<String, ArrayList<String>> errors = (HashMap<String, ArrayList<String>>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    ArrayList<String> listPosition = (ArrayList<String>) request.getAttribute("positionList");
    ArrayList<String> departmentList = (ArrayList<String>) request.getAttribute("departmentList");
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <style>
        .error-msg {
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="">
        <form action="/employee/create" method="post">
            <div class="form-group">
                <label>FullName</label>
                <input type="text" class="form-control" name="full_name" placeholder="FullName"
                       value="<%=employee.getFullName() %>">
                <span class="error-msg">
                    <%
                        if (errors.containsKey("full_name")) {
                            ArrayList<String> fullNameErrors = errors.get("full_name");
                            for (String msg : fullNameErrors) {
                    %>
                    <li><%=msg%></li>
                    <%
                            }
                        }%>
                </span>
            </div>
            <div class="form-group">
                <label for="address">Email address</label>
                <input type="text" name="address" class="form-control" id="address"
                       aria-describedby="emailHelp" placeholder="Enter address" value="<%=employee.getAddress() %>">
                <span class="error-msg">
                    <%
                        if (errors.containsKey("address")) {
                            ArrayList<String> fullNameErrors = errors.get("address");
                            for (String msg : fullNameErrors) {
                    %>
                    <li><%=msg%></li>
                    <%
                            }
                        }%>
                </span>
            </div>
            <div class="form-group">
                <label for="birthday">Email address</label>
                <input type="date" name="birthday" class="form-control" id="birthday"
                       aria-describedby="emailHelp" value="<%=employee.getBirthday() %>">
                <span class="error-msg">
                    <%
                        if (errors.containsKey("birthday")) {
                            ArrayList<String> fullNameErrors = errors.get("birthday");
                            for (String msg : fullNameErrors) {
                    %>
                    <li><%=msg%></li>
                    <%
                            }
                        }%>
                </span>
            </div>
            <div>
                <label for="departmentList"></label>
                <select name="department" id="departmentList">
                    <%
                        for (String value : departmentList
                        ) {%>
                    <option value="<%= value%>"><%= value %>
                    </option>
                    <% }%>
                </select>
            </div>
            <div>
                <label for="listPosition"></label>
                <select name="position" id="listPosition">
                    <%
                        for (String value : listPosition
                        ) {%>
                    <option value="<%= value%>"><%= value %>
                    </option>
                    <% }%>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>

</body>
</html>
