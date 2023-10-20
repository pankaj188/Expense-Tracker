package com.expensetracker.expensetracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.expensetracker.expensetracker.model.Expense;

public interface ExpenseRepository extends JpaRepository<Expense, Long>{

}