## ExpenseTracker-SpringBoot-React

This is an Fullstack Web Application to Track personal Expenses developed using :
### Backend REST APIs : Java (SpringBoot) Frontend Web App: ReactJS

#### With this application, customers can add, edit, track expenses, select one or many and delete the expenses

----

  * [Introduction](#introduction)
  * [Key Features](#key-features)
  * [Technologies used](#technologies-used)
      - [Client](#client)
      - [Server](#server)
      - [Database](#database)

## Introduction
This is a full stack Expance Tracking application made using Backend REST APIs : Java (SpringBoot) Frontend Web App: ReactJS and MySql Data Base, With this application, customers can add, edit, track expenses, select one or many and delete the expenses.

Server:
To start the backend server using Maven:
`mvn spring-boot:run `

To start the web app:

```
cd app
npm start

```
Runs in any tomcat 8.0 or higher versions.

## Application Features:
1. The application lets you enter the expenses and submit it. You can even upload a receipt for every record of expense.
2. If the category is not present, you will be allowed to add a new category.
3. If you feel the category is not necessary anymore, you can delete it.
4. The TRACK EXPENSE button will take you to the page where you can track the expenses based on 
   Date
   Category
5. On tracking the expense based on above categories, you will be having below features
   - select one or many and delete the expense
   - edit any expense
   - hover over the receipt for zoom view
   - add expence
   - Expense can be tracked

## Technologies used
This project was created using the following technologies.

#### Client

- React JS
- Redux (for managing and centralizing application state)
- React-router-dom (To handle routing)
- Axios (for making api calls)
- Material UI & CSS Module (for User Interface)

#### Server

- Java
- Spring Boot
- Spring MVC
- Spring REST
- Spring Data JPA

#### Database
MySQL