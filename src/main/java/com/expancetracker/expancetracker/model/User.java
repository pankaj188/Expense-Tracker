package com.expancetracker.expancetracker.model;
import org.springframework.stereotype.Component;

@Component
public class User {
private String email;
private String pass;
private String name;
private String profileimage;
private String expensetable;


public String getExpensetable() {
return expensetable;
}

public void setExpensetable(String expensetable) {
this.expensetable = expensetable;
}

public String getProfileimage() {
return profileimage;
}

public void setProfileimage(String profileimage) {
this.profileimage = profileimage;
}

public String getEmail() {
return email;
}

public void setEmail(String email) {
this.email = email;
}

public String getPass() {
return pass;
}

public void setPass(String pass) {
this.pass = pass;
}

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

}
