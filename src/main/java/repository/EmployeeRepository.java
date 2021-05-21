package repository;

import entity.Employee;
import helper.GenericModel;

import java.util.List;

public class EmployeeRepository {
    private GenericModel<Employee> genericModel = new GenericModel<>(Employee.class);

    public boolean save(Employee employee) {
        return genericModel.save(employee);
    }

    public List<Employee> getList() {
        return genericModel.findAll();
    }


}
