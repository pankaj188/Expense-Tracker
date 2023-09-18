package com.expancetracker.expancetracker.model;
import org.springframework.stereotype.Component;

@Component
public class Product {
private String name;
private float price;
private int quantity;
private String date;
private int id;

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public float getPrice() {
return price;
}

public void setPrice(float price) {
this.price = price;
}

public int getQuantity() {
return quantity;
}

public void setQuantity(int quantity) {
this.quantity = quantity;
}

public String getDate() {
return date;
}

public void setDate(String date) {
this.date = date;
}

public int getId() {
return id;
}

public void setId(int id) {
this.id = id;
}

}
