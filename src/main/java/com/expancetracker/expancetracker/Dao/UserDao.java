package com.expancetracker.expancetracker.Dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.expancetracker.expancetracker.model.User;

@Repository
public class UserDao {

@Autowired
private JdbcTemplate jdbcTemplate;

public int insert(User user) {
return jdbcTemplate.update("insert into user values(?,?,?,?,?)",
new Object[] { user.getName(), user.getEmail(), user.getPass(),user.getProfileimage(),user.getExpensetable() });
}

public int updateProfile(User user) {
return jdbcTemplate.update("update user set name=?,pass=?,profile=?,expensetable=? where email=?",
new Object[] { user.getName(), user.getPass(), user.getProfileimage(),user.getExpensetable(), user.getEmail() });
}

public User login(String email, String pass) {
User user = null;
List<User> users = jdbcTemplate.query("select * from user where email=? and pass=?",
new Object[] { email, pass }, new MyRowMapper());
if (users.size() > 0) {
user = users.get(0);
}
return user;
}

private class MyRowMapper implements RowMapper<User> {

@Override
public User mapRow(ResultSet rs, int rowNum) throws SQLException {
User user = new User();
user.setName(rs.getString(1));
user.setEmail(rs.getString(2));
user.setPass(rs.getString(3));
user.setProfileimage(rs.getString(4));
user.setExpensetable(rs.getString(5));
return user;
}

}
}