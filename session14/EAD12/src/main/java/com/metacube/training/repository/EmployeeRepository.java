package com.metacube.training.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.metacube.training.model.Employee;
import com.metacube.training.model.JobTitle;

public interface EmployeeRepository<E> extends JpaRepository<Employee, String>{

	@Query("FROM Employee ORDER BY empCode DESC ")
	List<Employee> getLastEmployeeAdded();

}
