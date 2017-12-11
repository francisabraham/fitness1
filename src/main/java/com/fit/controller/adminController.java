package com.fit.controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
/*import org.springframework.ui.Model;*/
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fit.DaoImpl.*;
import com.fit.model.*;
@SuppressWarnings("unused")
@RequestMapping("/admin")
@Controller
@Repository
public class adminController {
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	@Autowired
	UserDaoImpl userDaoImpl;
	@Autowired
	OrdersDaoImpl ordersDaoImpl;
	
	
	@RequestMapping(value="/saveSupp",method=RequestMethod.POST)
	public ModelAndView saveSupplier(@RequestParam("sid")int sid,@RequestParam("sname")String sname)
	{
	ModelAndView mv=new ModelAndView();
	Supplier s=new Supplier();
	s.setSid(sid);
	s.setSname(sname);
	supplierDaoImpl.insertSupplier(s);
	mv.setViewName("adding");
	return mv;
	}
	
	@RequestMapping(value="/saveCat",method=RequestMethod.POST)
	public ModelAndView saveCategory(@RequestParam("cid")int cid,@RequestParam("cname")String cname)
	{
	ModelAndView mv=new ModelAndView();
	Category c=new Category();
	c.setCid(cid);
	c.setCname(cname);
	categoryDaoImpl.insertCategory(c);
	mv.setViewName("adding");
	return mv;
	}
	
	
	@RequestMapping(value="/saveProd", method=RequestMethod.POST)
	
	public String saveProduct(HttpServletRequest req,@RequestParam("file") MultipartFile file)
	{
	Product p=new Product();
	p.setPname(req.getParameter("pName"));
	p.setPrice(Float.parseFloat(req.getParameter("pPrice")));
	p.setCategory(categoryDaoImpl.findById(Integer.parseInt(req.getParameter("pCategory"))));
	p.setSupplier(supplierDaoImpl.findById(Integer.parseInt(req.getParameter("pSupplier"))));
	p.setStock(Integer.parseInt(req.getParameter("pStock")));
	p.setDescription(req.getParameter("pDescription"));
	//String imgName=req.getParameter("imgname");
	   
	
	String filepath=req.getSession().getServletContext().getRealPath("/");
	String filename=file.getOriginalFilename();
	p.setImgname(filename);
	productDaoImpl.insertProduct(p);
	System.out.println("File path File" +filepath+  " " +filename);
	
	try
	{
		byte imagebyte[]=file.getBytes();
		BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/images/"+filename));
		fos.write(imagebyte);
		fos.close();
	}
	catch(IOException e)
	{
		e.printStackTrace();}
	
	return "modal";
	}
	
	
	
	
	
	@ModelAttribute
	public Model addData(Model m)
	{m.addAttribute("catList",categoryDaoImpl.retrieve());
	m.addAttribute("prodList",productDaoImpl.retrieve());
	m.addAttribute("supList",supplierDaoImpl.retrieve());
	m.addAttribute("userList",userDaoImpl.retrieve());
	
	return m;
	}
	
	
	@RequestMapping("/custList")
	public ModelAndView customerList()
	{ModelAndView mav=new ModelAndView();
	mav.addObject("userList",userDaoImpl.retrieve());
	mav.setViewName("custList");
	return mav;	
		
	}
	
	
	
	
	@RequestMapping("/productList")
	public ModelAndView productList()
	{ModelAndView mav=new ModelAndView();
	mav.addObject("prodList",productDaoImpl.retrieve());
	mav.setViewName("productList");
	return mav;
	}
	


	@RequestMapping("/deleteProduct/{pid}")
	public String deleteProd(@PathVariable("pid")int pid)
	{
		productDaoImpl.deleteProduct(pid);
		return "redirect:/admin/productList?del";
		}
	
	
	@RequestMapping("/updateProduct")
	public ModelAndView updateProd(@RequestParam("id")int pid)
	{
		ModelAndView mv=new ModelAndView();
		Product p=productDaoImpl.findById(pid);
		mv.addObject("prod",p);
		mv.addObject("cList",categoryDaoImpl.retrieve());
		mv.addObject("sList",supplierDaoImpl.retrieve());
		mv.setViewName("updateProduct");
		return mv;
	}
	
	@RequestMapping(value="/productUpdate",method=RequestMethod.POST)
	public ModelAndView updateProduct(HttpServletRequest request,@RequestParam("file") MultipartFile file)
	{	System.out.println("called");
		ModelAndView mv=new ModelAndView();
	//	String a=request.getParameter("pid");
		String pname=request.getParameter("pName");
		
		String ct=request.getParameter("pCategory");
		String sp=request.getParameter("pSupplier");
		
		String p=request.getParameter("pPrice");
		String d=request.getParameter("pDescription");
		String q=request.getParameter("pStock");
		
		//Categorydetails cat=new Categorydetails();
		//cat.setProducts(productDaoImpl.findById(Integer.parseInt(pid)));
		
		Product prod2=new Product();
		//prod2.setId(Integer.parseInt(a));
	prod2.setPname(pname);
	prod2.setCategory(categoryDaoImpl.findById(Integer.parseInt(ct)));
	prod2.setSupplier(supplierDaoImpl.findById(Integer.parseInt(sp)));
	prod2.setPrice(Float.parseFloat(p));
	prod2.setDescription(d);
	prod2.setStock(Integer.parseInt(q));
	
	
	String filepath=request.getSession().getServletContext().getRealPath("/");
	String filename=file.getOriginalFilename();
	prod2.setImgname(filename);
	productDaoImpl.update(prod2);
	System.out.println("File path File" + filepath+ " " +filename);
	try
	{
		byte imagebyte[]=file.getBytes();
		BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
		fos.write(imagebyte);
		fos.close();
	}
	
	
	
	catch(IOException e)
	{e.printStackTrace();
	}
	
	catch(Exception e)
	{e.printStackTrace();
	}
	
	mv.setViewName("redirect:/admin/productList?update");
	return mv;
	}
	
	
	@RequestMapping("/categoryList")
	public ModelAndView categoryList()
	{ModelAndView mav=new ModelAndView();
	mav.addObject("catList",categoryDaoImpl.retrieve());
	mav.setViewName("categoryList");
	return mav;	
		
	}
	
	
	@RequestMapping("/deleteCat/{cid}")
	public String deleteCategory(@PathVariable("cid")int cid)
	{
		categoryDaoImpl.deleteCategory(cid);
		return "redirect:/admin/categoryList?del";
	}
	
	
	
	@RequestMapping("/updateCategory")
	public ModelAndView updateCat(@RequestParam("id")int cid)
	{ModelAndView mv=new ModelAndView();
	Category c=categoryDaoImpl.findById(cid);
	mv.addObject("cList",categoryDaoImpl.retrieve());
	mv.setViewName("updateCategory");
	return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/Categoryupdate",method=RequestMethod.POST)
	public ModelAndView updateCategory(@RequestParam("cid")int cid,@RequestParam("cname")String cname)
	{
		ModelAndView mav =new ModelAndView();
		Category c=new Category();
		c.setCid(cid);
		c.setCname(cname);
		categoryDaoImpl.update(c);
		mav.setViewName("redirect:/admin/categoryList?update");
		return mav;
	}
	@RequestMapping("/supList")
	public ModelAndView supList()
	{ModelAndView mav=new ModelAndView();
	mav.addObject("satList",supplierDaoImpl.retrieve());
	mav.setViewName("supList");
	return mav;	
		
	}
	
	@RequestMapping("/deletesat/{sid}")
	public String deleteSupplier(@PathVariable("sid")int sid)
	{
		supplierDaoImpl.deleteSupplier(sid);
		return "redirect:/admin/supList?del";
	}
	

	
	@RequestMapping("/updateSupplier")
	public ModelAndView updateSat(@RequestParam("id")int sid)
	{ModelAndView mv=new ModelAndView();
	Supplier s=supplierDaoImpl.findById(sid);
	mv.addObject("sList",supplierDaoImpl.retrieve());
	mv.setViewName("updateSupplier");
	return mv;
	}
	
	@RequestMapping(value="/Supplierupdate",method=RequestMethod.POST)
	public ModelAndView updateSupplier(@RequestParam("sid")int sid,@RequestParam("sname")String sname)
	{
		ModelAndView mav =new ModelAndView();
		Supplier s=new Supplier();
		s.setSid(sid);
		s.setSname(sname);
		supplierDaoImpl.update(s);
		mav.setViewName("redirect:/admin/supList?update");
		return mav;
	}
	@RequestMapping("/adding")
	public String addPage()
	{
		return "adding";
		
	}
	
	@RequestMapping("/index")
	public String addHome()
	{
		return "index";
		
	}
	
}
