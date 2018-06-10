package edu.mum.coffee.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

@Controller
public class ProductController {
	
	@Resource
	private ProductService productService;

	@RequestMapping(value = { "/newProductForm" }, method = RequestMethod.GET)
	public String newProductForm(Model model) {
		System.out.println("createNewForm called...");
		model.addAttribute("newProduct", new Product());
		return "newProductForm";
	}

	@RequestMapping(value = { "/create" }, method = RequestMethod.POST)
	public String createProduct(@ModelAttribute("newProduct") Product newProduct) {
		System.out.println("createNewProduct called: " + newProduct.getProductName());
		productService.save(newProduct);
		return "redirect:/welcome";
	}

	@RequestMapping(value = { "/editProductForm/{id}" }, method = RequestMethod.GET)
	public ModelAndView editProductForm(@PathVariable("id") int id) {
		System.out.println("Edit-Product-Form called...");
		Product productToEdit = productService.getProduct(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("productToEdit", productToEdit);
		mv.setViewName("editProductForm");
		return mv;
	}

	@RequestMapping(value = { "/editProduct" }, method = RequestMethod.POST)
	public String editSelectedProduct(@ModelAttribute("newProduct") @Valid Product product, BindingResult result,
			Model model) {
		System.out.println("createNewProduct called: " + product.getProductName());
		if (!result.hasErrors()) {
			productService.save(product);
		}
		return "redirect:/welcome";
	}

	@RequestMapping(value = { "/deleteProduct/{id}" }, method = RequestMethod.GET)
	public String deleteSelectedProduct(@PathVariable("id") int id) {
		System.out.println("Delete Product called: " + id);
		//Product product = productService.getProduct(id);
		//productService.delete(product);
		return "redirect:/product/"+id;
	}

}
