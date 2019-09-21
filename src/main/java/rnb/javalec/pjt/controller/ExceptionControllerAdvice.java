package rnb.javalec.pjt.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import rnb.javalec.pjt.exception.UserNotFoundException;

@ControllerAdvice
public class ExceptionControllerAdvice {

  	@ExceptionHandler(Exception.class)
	public ModelAndView UserNotFoundExcept(UserNotFoundException e) {
		
		ModelAndView mav = new ModelAndView("UserNotFoundException");
		mav.addObject("name", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());
		
		return mav;
		
	}
	
}
 