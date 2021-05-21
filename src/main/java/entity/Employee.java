package entity;

import hannotation.Column;
import hannotation.Entity;
import hannotation.Id;
import hannotation.Validate;

import java.sql.Date;

@Entity(tableName = "employees")
public class Employee {
    @Id(autoIncreament = true)
    @Column(columnName = "id", columnType = "int")
    private int id;
    @Validate(required = true,min = 5,requiredMessage = "Name can't be empty")
    @Column(columnName = "full_name", columnType = "varchar(255)")
    private String fullName;

    @Validate(required = true, min = 7 , requiredMessage = "Address can't be empty")
    @Column(columnName = "address", columnType = "varchar(255)")
    private String address;

    @Validate(required = true, requiredMessage = "Your birthday can't be empty")
    @Column(columnName = "birthday", columnType = "date")
    private Date birthday;

    @Column(columnName = "position", columnType = "varchar(255)")
    private String position;

    @Column(columnName = "department", columnType = "varchar(255)")
    private String department;

    public Employee() {
    }

    public Employee(String fullName, String address, Date birthday, String position, String department) {
        this.fullName = fullName;
        this.address = address;
        this.birthday = birthday;
        this.position = position;
        this.department = department;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", address='" + address + '\'' +
                ", birthday=" + birthday +
                ", position='" + position + '\'' +
                ", department='" + department + '\'' +
                '}';
    }
}
