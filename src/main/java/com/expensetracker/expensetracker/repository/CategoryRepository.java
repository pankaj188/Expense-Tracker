package com.expensetracker.expensetracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.expensetracker.expensetracker.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long>{

	Category findByName(String name);
	
}