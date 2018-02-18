/**
 *Author : OMKAR SHIVADEKAR
 *Document : EmployeeService.java
 *Date : 12-Feb-2018
 *Time : 2:24:54 PM 
 */
package com.scrud.springdemo.service;

import java.util.List;

import com.scrud.entity.Employee;

public interface EmployeeService {

	public List<Employee> getEmployees();
	
	public List getEmpDetails(String empName);
	
	public void saveEmployee(Employee theEmployee);
	
	public List getEmpForUpdate(String id);
	
	public void deleteEmployee(int id);
}
