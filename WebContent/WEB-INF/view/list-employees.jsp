<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<title>Employee Details</title>
<style type="text/css">
body {
    padding-top: 70px;
  }
  
  #snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}

</style>
</head>
<body onload="myFunction()">
	  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">CRUD APP</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#saveEmp" data-toggle="modal" >Add Employee</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" id="eName" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="search()">Search</button>
        </form>
      </div>
    </nav>
    
    <div class="container">
	  <c:if test="${STATUS != null}">
  			<div id="snackbar">${STATUS}</div>
		</c:if>
	  
	  <h2>Employee Details</h2>
	  
	  <table class="table table-striped">
	    <thead>
	      <tr>
	      	<th>Sr. No.</th>
	        <th>Name</th>
	        <th>Address</th>
	        <th>City</th>
	        <th>Gender</th>
	        <th>Phone No.</th>
	        <th>Action</th>
	      </tr>
	    </thead>
	    <tbody id="tableContent">
	    	<%int count=1; %>
	    	<c:forEach var="tempEmp" items="${employees}">
	    		 <tr>
			        <td><%=count %></td>
			        <td>${ tempEmp.name}</td>
			        <td>${ tempEmp.address}</td>
			        <td>${ tempEmp.city}</td>
			        <td>${ tempEmp.gender}</td>
			        <td>${ tempEmp.phone}</td>
			        <td><a href="#saveEmp" data-toggle="modal" onclick="updateEmp(${tempEmp.id})">Update</a> || <a href="#deleteEmp"  onclick="deleteEmp(${tempEmp.id})" data-toggle="modal">Delete</a></td>
			      </tr>
			      <%count++; %>
	    	</c:forEach>
	    </tbody>
	  </table>
		
	</div>
	
	
    



<!--Insert or Update Modal Start -->
<div class="modal fade" id="saveEmp" role="dialog">
  	<form:form action="saveEmployee" modelAttribute="employee"  method="POST" class="form-horizontal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Save Employee</h4>
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          

	              <div class="form-group row">
		          		<div class="col-lg-3  text-lg-right">
			              <label for="emplName" class="control-label">Name</label>
			             </div>
				          <div class="col-lg-8">
				          	<form:hidden path="id" id="emplId"/>
				          	<form:input id="emplName" class="form-control"  path="name" required="required"/>
				          </div>
			       </div>

					<div class="form-group row">
		          		<div class="col-lg-3  text-lg-right">
			              <label for="emplAddress" class="control-label">Addresss</label>
			             </div>
				          <div class="col-lg-8">
				          	<form:input id="emplAddress" class="form-control" path="address" required="required"/>
				          </div>
			       	</div>
			       	
			       	<div class="form-group row">
		          		<div class="col-lg-3  text-lg-right">
			              <label for="empCity" class="control-label">City</label>
			             </div>
				          <div class="col-lg-8">
				          	<form:select path="city" id="emplCity" class="form-control">
				          		<form:option value="" label="Select"></form:option>
				          		<form:option value="Karad" label="Karad"></form:option>
				          		<form:option value="Satara" label="Satara"></form:option>
				          		<form:option value="Pune" label="Pune"></form:option>
				          	</form:select>
				          </div>
			       	</div>
			       	
			       	<div class="form-group row">
		          		<div class="col-lg-3  text-lg-right">
			              <label for="empSex" class="control-label">Gender</label>
			             </div>
				          <div class="col-lg-8">
				          	<table cellpadding="6" >
				          		<tr>
				          			<td><form:radiobutton id="emplSexM" path="gender" value="male" class="form-control"/> </td>
				          			<td>Male</td>
				          			<td><form:radiobutton id="emplSexF" path="gender" value="female" class="form-control"/> </td>
				          			<td>Female</td>
				          		</tr>
				          		
				          	</table>
				          </div>
			       	</div>
			       	
			       	<div class="form-group row">
		          		<div class="col-lg-3  text-lg-right">
			              <label for="emplPhone" class="control-label">Contact No</label>
			             </div>
				          <div class="col-lg-8">
				          	<form:input id="emplPhone" class="form-control"  path="phone" maxlength="10" required="required"/>
				          </div>
			       </div>
			       	
      </div>
        <div class="modal-footer">
        	<button type="submit" class="btn btn-primary" >Save Employee</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			
        </div>
            
      </div>

    </div>
      </form:form>
  </div>
<!--Insert or Update  Modal End -->

<!-- Delete Modal Start -->
<div class="modal fade" id="deleteEmp" role="dialog">
  	<form:form action="deleteEmployee" modelAttribute="deleteEmp"  class="form-horizontal">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Delete Employee</h4>
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
        		<form:hidden path="id" id="emplDeleteId"/>		
    		   <div class="alert alert-warning">
  					<strong>Warning!</strong> Are you sure you want to delete this record ?
				</div>   
  	    </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary"  >Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </form:form>
  </div>
<!-- Delete Modal End -->




<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

<script type="text/javascript">


function myFunction() {
	
	if(document.getElementById("snackbar")!=null)
	{
		var x = document.getElementById("snackbar");
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);	
	}

		
    
}

function deleteEmp(id)
{
	alert(id);
	document.getElementById("emplDeleteId").value=id;
	
}

/*--------------------- for SEARCHING employees details start----------------- */
function search()
{
	var theSearch=document.getElementById("eName").value;
	
	if(theSearch.length>0)
	{
		//ajax
		 $.ajax({
			  type: "post",
			  url: "http://localhost:8080/SpringCRUD/employe/search.htm",
			  cache: false,    
			  data:'searchEmp=' +theSearch,
			  success: function(response){
			  var obj = JSON.parse(response);
			  setInTable(obj);
			  //alert(obj[0].address);
			  },
			  error: function(){      
			   alert('Error while request..');
			  }
			 });
	}
	else
	{
		alert("Plz enter what do you want to search");
	}
}

function setInTable(obj)
{
	
	document.getElementById("tableContent").innerHTML="";
	var tableData="";
	var count=1;
	for(var i=0;i<obj.length;i++)
	{
		tableData+="<tr>"
		+"<td>"+count+"</td>"
		+"<td>"+obj[i].name+"</td>"
		+"<td>"+obj[i].address+"</td>"
		+"<td>"+obj[i].city+"</td>"
		+"<td>"+obj[i].gender+"</td>"
		+"<td>"+obj[i].phone+"</td>"
		+"<td>Update || Delete</td>"
		+"</tr>";
			
		count++;	
	}
	document.getElementById("tableContent").innerHTML=tableData;
}

/*--------------------- for SEARCHING employees details end----------------- */


/*---------------------- for UPDATE employee details start--------------------- */

function updateEmp(id)
{
	///alert('work'+id);
	
	 $.ajax({
		  type: "post",
		  url: "http://localhost:8080/SpringCRUD/employe/update.htm",
		  cache: false,    
		  data:'empId='+id,
		  success: function(response){
		  var obj = JSON.parse(response);
		  setInModal(obj);
		  },
		  error: function(){      
		   alert('Error while request..');
		  }
		 });
	
	
}

function setInModal(obj)
{
	for(var i=0;i<obj.length;i++)
	{
		document.getElementById("emplId").value=obj[i].id;
		document.getElementById("emplName").value=obj[i].name;
		document.getElementById("emplAddress").value=obj[i].address;
		document.getElementById("emplCity").value=obj[i].city;
		if(obj[i].gender=='male')
		{
			document.getElementById("emplSexM").checked=true;
			document.getElementById("emplSexF").checked=false;
		}
		else
		{
			document.getElementById("emplSexM").checked=false;
			document.getElementById("emplSexF").checked=true;
		}
		
		document.getElementById("emplPhone").value=obj[i].phone;
	}
}


/*---------------------- for UPDATE employee details end--------------------- */


</script>
</body>
</html>