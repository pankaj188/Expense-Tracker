package com.expensetracker.expensetracker.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor
@Data
@Entity
@Table(name="category")
public class Category {
	
	@Id
	private Long id;
	
	@NonNull
	private String name;

}