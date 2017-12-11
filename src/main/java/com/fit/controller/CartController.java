package com.fit.controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fit.DaoImpl.*;
import com.fit.model.*;
@SuppressWarnings("unused")
@Controller
@Repository
public class CartController {
	@Autowired
	UserDaoImpl userDaoImpl;
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	CartDaoImpl cartDaoImpl;
	@Autowired
	OrdersDaoImpl ordersDaoImpl;
	
	
	
@RequestMapping(value="/prodDetails/{pid}")
	
	
	public ModelAndView productDetails(@PathVariable("pid")int pid)
	{
		ModelAndView mv= new ModelAndView();
		Product p=productDaoImpl.findById(pid);
		mv.addObject("product",p);
		mv.setViewName("prodDetails");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public ModelAndView addToCart(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
	Principal principal=request.getUserPrincipal();
	String userEmail=principal.getName();
	
	try{
		int pid=Integer.parseInt(request.getParameter("pid"));
		Double price=Double.parseDouble(request.getParameter("pPrice"));
		int qty=Integer.parseInt(request.getParameter("pQty"));
		String prodName=request.getParameter("pName");
		String imgName=request.getParameter("pImg");
		

	
	
Cart cartExists=cartDaoImpl.getCartById(pid, userEmail)	;
if(cartExists==null){
	Cart cm =new Cart();
cm.setCartProductId(pid);
cm.setCartPrice(price);
cm.setCartQuantity(qty);
cm.setCartImage(imgName);
cm.setCartProductName(prodName);

User u=userDaoImpl.findUserById(userEmail);

cm.setCartUserDetails(u);
cartDaoImpl.insert(cm);

}
	
	else if(cartExists!=null)
	{Cart cm=new Cart();
	cm.setCartId(cartExists.getCartId());
	cm.setCartProductId(pid);
	cm.setCartPrice(price);
	cm.setCartQuantity(cartExists.getCartQuantity()+qty);
	cm.setCartImage(imgName);
	cm.setCartProductName(prodName);
	User u=userDaoImpl.findUserById(userEmail);
	
	cm.setCartUserDetails(u);
	cartDaoImpl.updateCart(cm);
	
}
	mv.addObject("cartInfo",cartDaoImpl.findCartById(userEmail));
	mv.setViewName("Cart");	
	
return mv;	
}
	catch(Exception e)
	{
	mv.addObject("cartInfo",cartDaoImpl.findCartById(userEmail));
	mv.setViewName("Cart");
return mv;	
}	
}
	
	
	
	@RequestMapping(value="/checkout",method=RequestMethod.GET)

	public ModelAndView goToCheckout(HttpServletRequest req)
	{
		ModelAndView mv=new ModelAndView();
	Principal principal=req.getUserPrincipal();
	String userEmail=principal.getName();
	User user=userDaoImpl.findUserById(userEmail);
	List<Cart>cart=cartDaoImpl.findCartById(userEmail);
	mv.addObject("user",user);
	mv.addObject("cart",cart);
	
	return mv;
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/deletePCart/{cartId}")
	public ModelAndView deleteCartItem(@PathVariable("cartId")int cartId,HttpServletRequest req)
	{ModelAndView mv=new ModelAndView();
	Principal principal=req.getUserPrincipal();
	String userEmail=principal.getName();
	cartDaoImpl.deleteCart(cartId);
	mv.addObject("cartInfo",cartDaoImpl.findCartById(userEmail));
	mv.setViewName("Cart");
return mv;	
}
	
	
	
	@RequestMapping(value="/invoiceprocess",method=RequestMethod.POST)
	public ModelAndView orderSaved(HttpServletRequest req)
	{
		ModelAndView mv=new ModelAndView("invoice");
	Orders ord=new Orders();
	Principal principal=req.getUserPrincipal();
	String userEmail=principal.getName();
	List<Cart>cart=cartDaoImpl.findCartById(userEmail);
	Double total=Double.parseDouble(req.getParameter("total"));
	//int qty=Integer.parseInt(req.getParameter("pQty"));
	String payment=req.getParameter("payment");
	User users=userDaoImpl.findUserById(userEmail);
	ord.setUser(users);
	ord.setTotal(total);
	ord.setPayment(payment);
	ordersDaoImpl.insert(ord);
	mv.addObject("user",cartDaoImpl.findCartById(userEmail));
	mv.addObject("Orders",users);
	
//	mv.addObject("pqty",qty);
	
	mv.addObject("cart",cart);
	
	return mv;
	}
	
	
	@RequestMapping("/ack")
	public String ack()
	{
		return "ack";
	}
	
	
	@RequestMapping(value="/goToCart",method=RequestMethod.GET)
	public ModelAndView gotocart(HttpServletRequest req)
	{ModelAndView mv=new ModelAndView();
	Principal principal=req.getUserPrincipal();
	String userEmail=principal.getName();
	mv.addObject("cartInfo",cartDaoImpl.findCartById(userEmail));
	mv.setViewName("Cart");
return mv;	

	}
	
	}
