		package com.fit.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;
import com.fit.Dao.*;
import com.fit.DaoImpl.*;
import com.fit.model.*;
@Controller 
public class indexController

{
	@Autowired
	User user;

	@Autowired
	UserDaoImpl userDaoImpl;
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	
	@RequestMapping(value = "/") 
	public String displayindex(Model model) 
	{ 
		
	return "index";
 
	}
	
	@RequestMapping(value="/Register",method=RequestMethod.GET)
	public ModelAndView goToRegister() {
		ModelAndView mv=new ModelAndView();
	    mv.addObject("user",new User());
		mv.setViewName("Register");
	return mv;
	}
	
	@RequestMapping(value="/saveRegister",method=RequestMethod.POST)
	public ModelAndView saveUser( @Valid @ModelAttribute("user") User user, BindingResult res)
	{
		System.out.println("HIIII");
		System.out.println(user.getName());
		ModelAndView mv=new ModelAndView();
		user.setRole("ROLE_USER");
		userDaoImpl.insertUser(user);
		mv.setViewName("login");
		return mv;
	}

	
	
	@ModelAttribute
	public Model fetchData(Model m)
	{
    m.addAttribute("catList",categoryDaoImpl.retrieve());
	m.addAttribute("prodList",productDaoImpl.retrieve());
    m.addAttribute("supList",supplierDaoImpl.retrieve());
    m.addAttribute("userList",userDaoImpl.retrieve());
	
	return m;
	}
	
	
	@RequestMapping(value="/prodCustList")
	public ModelAndView getCustTable(@RequestParam("cid")int cid)
	{
		System.out.println(cid);
	ModelAndView mv=new ModelAndView();
	mv.addObject("prodList",productDaoImpl.retrieve());
	mv.setViewName("prodCustList");//productCustList
	return mv;
	}
	
	@RequestMapping("/Header")
	public String Header()
	{
		return "Header";
	}


	@RequestMapping("/about")
	public String about()
	{
		return "about";
	}
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	@RequestMapping("/goTologin")
	public ModelAndView goTologin()
	{
		ModelAndView mv =new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("/userLogged")
	public String userLogged()
	{
		return "redirect:/index";
	}
	@RequestMapping("/error")
	public String errorpage()
	{
		return "/error";
	}
	
	@RequestMapping("/adding")
	public String ad()
	{
		return "adding";

}
	@RequestMapping("/admin")
	public String add()
	{
		return "admin";


}
	
	/*@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session,Model model) {
		String email = SecurityContextHolder.getContext().getAuthentication().getName();
	//	User username = userDaoImpl.insertUser(email);
		session.setAttribute("username", user.getEmail());
		session.setAttribute("password", user.getPassword());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()	.getAuthentication().getAuthorities();
		String page="";
		String role="ROLE_ADMIN";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("LoggedIn", "true");
			 page="/adding";
		    	 }
		     else 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
			page="/index";
		    }
		}
		return page;
	}*/
	@RequestMapping("/contact")
	public String contact()
	{
		return "contact";
	}
}


