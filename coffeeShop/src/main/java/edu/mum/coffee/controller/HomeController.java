package edu.mum.coffee.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.ProductService;

@Controller
public class HomeController {
	
	@Resource
	private ProductService productService;
	@Resource
	private PersonService personService;
	@Resource
	private OrderService orderService;

	@RequestMapping(value = { "/", "/index", "/home" }, method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		return model;
	}

//	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
//	public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout) {
//
//		ModelAndView model = new ModelAndView();
//		if (error != null) {
//			model.addObject("error", "Invalid Credentials provided.");
//		}
//
//		if (logout != null) {
//			model.addObject("message", "Logged out from website successfully.");
//		}
//
//		model.setViewName("login");
//		return model;
//	}

	@GetMapping({"/login"})
	public String loginPage() {
		System.out.println("Get /login: welcome page called");
		return "login";
	}
	
	@GetMapping({"/register"})
	public String registerPage() {
		System.out.println("Get /register: welcome page called");
		return "register";
	}

//	@PostMapping({ "/login" })
//	public String welcome() {
//		System.out.println("Post /login: welcome page called");
//		return "redirect:/welcome";
//	}

//	@GetMapping({"/home"})
//	public String homeHomePage() {
//		System.out.println("welcome page called");
//		return "home";
//	}

	@RequestMapping(value = { "/welcome" }, method = RequestMethod.GET)
	public ModelAndView mainHomePage() {
		System.out.println("welcome page called");
		ModelAndView model = new ModelAndView();
		
		List<Product> products = productService.getAllProduct();
		model.addObject("products", products);
		
		List<Order> orders = orderService.findAll();
		model.addObject("orders", orders);
		
		List<Person> persons = personService.getAllPersons();
		model.addObject("persons", persons);
		
		model.setViewName("main-home");
		return model;
	}

	@RequestMapping(value = { "/user" }, method = RequestMethod.GET)
	public ModelAndView userHomePage() {
		System.out.println("User page called");
		ModelAndView model = new ModelAndView();
		model.setViewName("user");
		return model;
	}
	
}
