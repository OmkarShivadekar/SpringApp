/**
 *Author : OMKAR SHIVADEKAR
 *Document : EmployeeServiceImpl.java
 *Date : 12-Feb-2018
 *Time : 2:27:01 PM 
 */
package com.scrud.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scrud.entity.Employee;
import com.scrud.springdemo.dao.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired	
	private EmployeeDAO empDAO;
	
	@Override
	@Transactional
	public List<Employee> getEmployees() {
		
		return empDAO.getEmps();
	}

	@Override
	@Transactional
	public List getEmpDetails(String empName) {

		return empDAO.getEmp(empName);
	}

	@Override
	@Transactional
	public void saveEmployee(Employee theEmployee) {

		empDAO.saveEmp(theEmployee);
		
	}

	@Override
	@Transactional
	public List getEmpForUpdate(String id) {

		return empDAO.getEmpForUpdate(id);
	}

	@Override
	@Transactional
	public void deleteEmployee(int id) {
		
		empDAO.deleteEmployee(id);
	}

}
