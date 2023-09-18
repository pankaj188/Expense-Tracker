package com.expancetracker.expancetracker.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.expancetracker.expancetracker.model.Product;
import com.expancetracker.expancetracker.model.User;

@Controller
public class ProductController {

@Autowired
private ProductDao productDao;

@GetMapping("/")
public String mainPage() {
return "index";
}

@GetMapping("addexpense")
public String addExpenses() {
return "addexpense";
}

@PostMapping("addexpenseprocess")
public String addExpensesProcess(Product product, Model model,HttpSession session) {
int i = productDao.insert(product,((User)session.getAttribute("user")).getExpensetable());
if (i > 0) {
model.addAttribute("msg", "Successfully Added");
}else {
model.addAttribute("msg", "Added Failed");
}
return "addexpense";
}

@GetMapping("listofexpenses")
public String expenseList(Model model,HttpSession session) {

List<Product>list=productDao.getAllExpenses(((User)session.getAttribute("user")).getExpensetable());
model.addAttribute("exp",list);
return "listofexpenses";
}

@PostMapping("delete/{id}")
public String deleteExpense(@PathVariable() int id,HttpSession session) {
int i=productDao.deleteExpense(id,((User)session.getAttribute("user")).getExpensetable());
return "redirect:/listofexpenses";
}

@PostMapping("update")
public String updateExpense(Product product,HttpSession session) {
int i=productDao.updateExpense(product,((User)session.getAttribute("user")).getExpensetable());
return "redirect:/listofexpenses";
}

}