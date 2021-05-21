<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Win10Pro
  Date: 4/23/2021
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Employee> listEmployee = (ArrayList<Employee>) request.getAttribute("list"); %>
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
</head>
<body>

<div class="container">
    <div class="">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">FullName</th>
                <th scope="col">Address</th>
                <th scope="col">BirthDay</th>
                <th scope="col">Position</th>
                <th scope="col">Department</th>
            </tr>
            </thead>
            <tbody>
            <% if (listEmployee != null && listEmployee.size() > 0) {
                for (int i = 0; i < listEmployee.size(); i++) {
            %>
            <tr>
                <th scope="row"><%= listEmployee.get(i).getId() %>
                </th>
                <td><%= listEmployee.get(i).getFullName() %>
                </td>
                <td><%= listEmployee.get(i).getAddress() %>
                </td>
                <td><%= listEmployee.get(i).getBirthday() %>
                </td>
                <td><%= listEmployee.get(i).getPosition() %>
                </td>
                <td><%= listEmployee.get(i).getDepartment() %>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
        <div>
            <a href="/employee/create" class="badge badge-primary">To Create</a>
        </div>
    </div>
</div>
</body>
</html>
