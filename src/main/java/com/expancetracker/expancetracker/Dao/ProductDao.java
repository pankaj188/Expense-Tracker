package com.expancetracker.expancetracker.Dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.expancetracker.expancetracker.model.Product;

@Repository
public class ProductDao {

@Autowired
private JdbcTemplate jdbcTemplate;

public void createTable(String tablename) {
jdbcTemplate.execute("create table "+tablename+" (id int NOT NULL AUTO_INCREMENT,name varchar(25) NOT NULL,price
float,quantity int,date varchar(20),PRIMARY KEY (id))");
}

public int insert(Product product, String tablename) {
return jdbcTemplate.update("insert into " + tablename + " values(default,?,?,?,?)",
new Object[] { product.getName(), product.getPrice(), product.getQuantity(), product.getDate() });
}

public int deleteExpense(int id, String tablename) {
return jdbcTemplate.update("delete from " + tablename + " where id=?", new Object[] { id });
}

public int updateExpense(Product product, String tablename) {
return jdbcTemplate.update("update " + tablename + " set name=?, price=?, quantity=?, date=? where id=?",
new Object[] { product.getName(), product.getPrice(), product.getQuantity(), product.getDate(),
product.getId() });
}

public List<Product> getAllExpenses(String tablename) {
return jdbcTemplate.query("select * from " + tablename + " ", new ProductRowMapper());
}

class ProductRowMapper implements RowMapper<Product> {

@Override
public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
Product product = new Product();
product.setId(rs.getInt(1));
product.setName(rs.getString(2));
product.setPrice(rs.getFloat(3));
product.setQuantity(rs.getInt(4));
product.setDate(rs.getString(5));
return product;
}

}

}