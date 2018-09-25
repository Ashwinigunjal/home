package com.home.restcontroller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.home.rest.entity.ErrorResponse;

@RestController
@RequestMapping("/api")
public class HomeRestController {

	@GetMapping("/hello")
	public List hello() {
		
		List<ErrorResponse> ll = new LinkedList<ErrorResponse>();
		ErrorResponse error= new ErrorResponse();
		error.setId("404");
		error.setMessage("page not found");
		 ll.add(error);
	
		return ll;
		
			
	
	}
	
	
	
}
