/**
 *Author : OMKAR SHIVADEKAR
 *Document : EmployeeDAO.java
 *Date : 10-Feb-2018
 *Time : 7:35:14 PM 
 */
package com.scrud.springdemo.dao;

import java.util.List;
import com.scrud.entity.Employee;

public interface EmployeeDAO {

	public List<Employee> getEmps();
	
	public List getEmp(String empName);
	
	public void saveEmp(Employee theEmployee);
	
	public List getEmpForUpdate(String id);
	
	public void deleteEmployee(int id);
}
