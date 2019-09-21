package rnb.javalec.pjt.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			String id = "anonymousUser";
			model.addAttribute("identity", id);
		} else {
			model.addAttribute("identity", "LogOut");
		}

		return "homePage";
	}

	@RequestMapping(value = "/IntroduceService", method = RequestMethod.GET)
	public String introdueceService() {

		return "introduceService/IntroduceService";
	}

	@RequestMapping(value = "/IntroduceDelivertoRnB", method = RequestMethod.GET)
	public String IntroduceDelivertoRnB() {

		return "introduceService/IntroduceDelivertoRnB";
	}

	@RequestMapping(value = "/IntroduceCompany", method = RequestMethod.GET)
	public String IntroduceCompany() {

		return "introduceService/IntroduceCompany";
	}

	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login() {

		return "login";
	}

	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout() {

		return "logout";
	}
	
	@RequestMapping(value = "/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {

		return "loginForm";
	}
	
}
