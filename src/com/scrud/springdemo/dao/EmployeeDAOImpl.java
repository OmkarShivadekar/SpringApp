/**
 *Author : OMKAR SHIVADEKAR
 *Document : EmployeeDAOImpl.java
 *Date : 10-Feb-2018
 *Time : 7:39:45 PM 
 */
package com.scrud.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.scrud.entity.Employee;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	/*injecting session factory (DI)*/
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Employee> getEmps() {
		
				//get the current hibernate session
				Session session = sessionFactory.getCurrentSession();
				
				//create a query
				Query<Employee> theQuery = session.createQuery("from Employee",Employee.class);
				
				//execute query and get result list
				List<Employee> employees=theQuery.getResultList();
				
				//return the results
				return employees;

	}

	@Override
	public List getEmp(String empName) {
		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		//create a query
		Query<Employee> theQuery = session.createQuery("from Employee where name like ?",Employee.class);
		
		theQuery.setParameter(0, "%"+empName+"%");
		
		
		List empDetails=theQuery.getResultList();
		
		return empDetails;
	}

	@Override
	public void saveEmp(Employee theEmployee) {

		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		//save/update the customer
		currentSession.saveOrUpdate(theEmployee);
				
	}

	@Override
	public List getEmpForUpdate(String id) {
		
		//get the current hibernate session
		Session session = sessionFactory.getCurrentSession();
		
		//create a query
		Query<Employee> theQuery = session.createQuery("from Employee where id=:empId",Employee.class);
			
		theQuery.setParameter("empId", Integer.parseInt(id));
		
		List empDetails=theQuery.getResultList();
		
		return empDetails;
	}

	@Override
	public void deleteEmployee(int id) {

		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
				
		//delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Employee where id=:employeeId");
		
		theQuery.setParameter("employeeId", id);
		
		theQuery.executeUpdate();
				
	}

}
