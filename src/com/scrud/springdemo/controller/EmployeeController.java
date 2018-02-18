/**
 *Author : OMKAR SHIVADEKAR
 *Document : EmployeeController.java
 *Date : 10-Feb-2018
 *Time : 4:27:43 PM 
 */
package com.scrud.springdemo.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.scrud.entity.Employee;
import com.scrud.springdemo.dao.EmployeeDAO;
import com.scrud.springdemo.service.EmployeeService;

@Controller
@RequestMapping("/employe")
public class EmployeeController {

	/*need to inject the employee service (DI)*/
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
    private MessageSource messageSource;

	
	
	
	@RequestMapping("/list")
	public String listEmployee(Model theModel) {
		
		//get employees from the service
		List<Employee> theEmployees = employeeService.getEmployees();
		
		//add the employees to the model
		theModel.addAttribute("employees", theEmployees);
		
		//created modelAttribue to bind the insert and update form data
		Employee theEmployee = new Employee();
		theModel.addAttribute("employee",theEmployee);
		
		//created modelAttribue to bind the delete form data
		Employee theEmp = new Employee();
		theModel.addAttribute("deleteEmp", theEmp);
		
		
		
		return "list-employees";
	}
	
	//AJAX method for searching employees details
	@RequestMapping(value="/search.htm",method = RequestMethod.POST)
	public @ResponseBody String searchEmployee(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String semp = request.getParameter("searchEmp");

		List empDetails = employeeService.getEmpDetails(semp);

		response.setContentType("application/json");
		Gson gson=new Gson();
		String json=gson.toJson(empDetails);
		
		return json;
	}
	
	@PostMapping("/saveEmployee")
	public String saveEmployee(@ModelAttribute("employee") Employee theEmployee, RedirectAttributes rda) {
		
		employeeService.saveEmployee(theEmployee);
		
		rda.addFlashAttribute("STATUS", "Save Successfully");
		
		return "redirect:/employe/list";
	}
	
	@PostMapping("/updateEmployee")
	public String updateEmployee(@ModelAttribute("updateEmp") Employee theEmloyee)
	{
		return "redirect:/employe/list";
	}
	
	//AJAX method for updating employees details
	@RequestMapping(value="/update.htm",method = RequestMethod.POST)
	public @ResponseBody String updateEmployee(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String empid = request.getParameter("empId");
		
		List empDetails = employeeService.getEmpForUpdate(empid);
		
		response.setContentType("application/json");
		
		Gson gson=new Gson();
		String json=gson.toJson(empDetails);
		
		return json;
		
	}
	
	@RequestMapping("/deleteEmployee")
	public String deleteCustomer( @ModelAttribute("deleteEmp") Employee emp, RedirectAttributes rda) {
		
		employeeService.deleteEmployee(emp.getId());
		rda.addFlashAttribute("STATUS", "Record Deleted");
		return "redirect:/employe/list";
	}
		
	
	
}
