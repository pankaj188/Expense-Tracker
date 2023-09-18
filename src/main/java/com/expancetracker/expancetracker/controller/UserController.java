package com.expancetracker.expancetracker.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.expancetracker.expancetracker.model.User;

@Controller
public class UserController {

@Autowired
private UserDao userDao;

@Autowired
private ProductDao productDao;

@PostMapping("login")
public String login(@RequestParam String email, @RequestParam String pass, Model model, HttpSession session) {
User user = userDao.login(email, pass);
if (user != null) {
session.setAttribute("user", user);
return "redirect:/homepage";
} else {
model.addAttribute("msg", "Invalid Email or Password");
return "index";
}
}

@GetMapping("/homepage")
public String homePage() {
return "homepage";
}

@PostMapping("/register")
public ModelAndView register(User user) {
int i = userDao.insert(user);
ModelAndView m = new ModelAndView();
if (i > 0) {
String tablename="exp"+String.valueOf(System.currentTimeMillis());
productDao.createTable(tablename);
user.setExpensetable(tablename);
userDao.updateProfile(user);
m.addObject("msg", "Successfully Registerd");
} else {
m.addObject("msg", "Registerd Failed");
}
m.setViewName("index");
return m;
}

@GetMapping("profile")
public String profile() {
return "profile";
}

@PostMapping("profileProcess")
public String profileProcess(@RequestParam("imageprofile") MultipartFile file,HttpSession session) {
String rootlocation=session.getServletContext().getRealPath("/");
File folder=new File(rootlocation,"profileimage");
folder.mkdir();

User user=(User)session.getAttribute("user");

File filename=new File(folder,user.getEmail()+".jpg");

if(!file.isEmpty()) {
try {
byte [] bytes=file.getBytes();
FileOutputStream fo=new FileOutputStream(filename);
fo.write(bytes);
fo.close();
user.setProfileimage(user.getEmail()+".jpg");
int i=userDao.updateProfile(user);
System.out.println(filename.getAbsolutePath());
} catch (IOException e) {
System.out.println(e);
}
}
return "redirect:/profile";
}

@GetMapping("logout")
public String logout( HttpSession session) {
session.removeAttribute("user");
session.invalidate();
return "redirect:/";
}

}