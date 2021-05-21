package service;

import entity.Employee;
import repository.EmployeeRepository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {
    private EmployeeRepository employeeRepository = new EmployeeRepository();

    public List<Employee> getListEmployee() {
        ArrayList<Employee> employees =  new ArrayList<Employee>(employeeRepository.getList());

        return  employees;
    }

    public Employee createEmployee(Employee employee) {
        employeeRepository.save(employee);

        return employee;
    }
}
