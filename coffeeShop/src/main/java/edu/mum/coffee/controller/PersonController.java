package edu.mum.coffee.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.PersonService;

@Controller
public class PersonController {
	
	@Resource
	private PersonService personService;

	@RequestMapping(value = { "/newPersonForm" }, method = RequestMethod.GET)
	public String newPersonForm(Model model) {
		System.out.println("createNewForm called...");
		Address address = new Address();
		Person person = new Person();
		person.setAddress(address);
		model.addAttribute("newPerson", person);
		return "newPersonForm";
	}

	@RequestMapping(value = { "/createPerson" }, method = RequestMethod.POST)
	public String createPerson(@ModelAttribute("newPerson") @Valid Person newPerson) {
		System.out.println("createNewProduct called: " + newPerson.getFirstName());
		
		System.out.println(newPerson.getAddress());
		newPerson.setEnable(true);
		personService.savePerson(newPerson);
		return "redirect:/welcome";
	}

	@RequestMapping(value = { "/editPersonForm/{id}" }, method = RequestMethod.GET)
	public ModelAndView editPersonForm(@PathVariable("id") Long id) {
		System.out.println("Edit-Product-Form called...");
		Person personToEdit = personService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("productToEdit", personToEdit);
		mv.setViewName("editPersonForm");
		return mv;
	}

//	@RequestMapping(value = { "/editPerson" }, method = RequestMethod.POST)
//	public String editSelectedPerson(@ModelAttribute("newProduct") @Valid Person product, BindingResult result,
//			Model model) {
//		System.out.println("createNewProduct called: " + product.getProductName());
//		if (!result.hasErrors()) {
//			personService.save(product);
//		}
//		return "redirect:/welcome";
//	}
//
//	@RequestMapping(value = { "/deletePerson/{id}" }, method = RequestMethod.GET)
//	public String deleteSelectedPerson(@PathVariable("id") int id) {
//		System.out.println("Delete Product called: " + id);
//		Person product = personService.getProduct(id);
//		personService.delete(product);
//		return "redirect:/welcome";
//	}
}
