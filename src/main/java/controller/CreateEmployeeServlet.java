package controller;

import entity.Employee;
import helper.GenericValidateClass;
import service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(value = "/employee/create")
public class CreateEmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<String> departmentList = new ArrayList<String>();
        departmentList.add("Backend");
        departmentList.add("Frontend");
        departmentList.add("Mobile");
        departmentList.add("None");
        req.setAttribute("departmentList",departmentList);
        ArrayList<String> positionList = new ArrayList<String>();
        positionList.add("Manage");
        positionList.add("Fresher");
        positionList.add("Intern");
        req.setAttribute("positionList",positionList);

        req.getRequestDispatcher("/resources/employees/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("full_name");
        String birthday = req.getParameter("birthday");
        String address = req.getParameter("address");
        String position = req.getParameter("position");
        String department = req.getParameter("department");
        Date date = Date.valueOf(birthday);
        ArrayList<String> departmentList = new ArrayList<String>();
        departmentList.add("Backend");
        departmentList.add("Frontend");
        departmentList.add("Mobile");
        departmentList.add("None");
        req.setAttribute("departmentList",departmentList);
        ArrayList<String> positionList = new ArrayList<String>();
        positionList.add("Manage");
        positionList.add("Fresher");
        positionList.add("Intern");
        req.setAttribute("positionList",positionList);

        Employee employee = new Employee(name, address, date, position, department);
        System.out.println(employee.toString());
        GenericValidateClass<Employee> accountGenericValidateClass = new GenericValidateClass<>(Employee.class);
        accountGenericValidateClass.validate(employee);
        if (!accountGenericValidateClass.validate(employee)) {
            System.out.println("Have Error");
            HashMap<String, ArrayList<String>> errors = accountGenericValidateClass.getErrors();
            System.out.println(errors);
            req.setAttribute("errors", errors);
            req.setAttribute("employee", employee);
            req.getRequestDispatcher("/resources/employees/form.jsp").forward(req, resp);
        }
        EmployeeService employeeService = new EmployeeService();
        employeeService.createEmployee(employee);
        resp.sendRedirect("/employee");
    }
}
