package com.expancetracker.expancetracker.controller;
import java.util.concurrent.TimeUnit;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.CacheControl;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = { "com.example" })
@EnableWebMvc
@PropertySource(value = { "classpath:data.properties" })
public class AppConfig implements WebMvcConfigurer {
            
@Autowired
private Environment environment;
            
@Override
public void configureViewResolvers(ViewResolverRegistry registry) {
registry.jsp("/WEB-INF/views/", ".jsp");
}
            
@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
// Register resource handler for images
registry.addResourceHandler("/images/**").addResourceLocations("/images/")
.setCacheControl(CacheControl.maxAge(0, TimeUnit.HOURS).cachePublic());
registry.addResourceHandler("/profileimage/**").addResourceLocations("/profileimage/")
.setCacheControl(CacheControl.maxAge(0, TimeUnit.HOURS).cachePublic());
}
            
@Bean
public DataSource dataSource() {
DriverManagerDataSource dataSource = new DriverManagerDataSource();
dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.class"));
dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
dataSource.setUsername(environment.getRequiredProperty("jdbc.user"));
dataSource.setPassword(environment.getRequiredProperty("jdbc.pass"));
System.out.println("Deep database " + dataSource);
return dataSource;
}
            
@Bean
public JdbcTemplate getJdbcTemplate() {
return new JdbcTemplate(dataSource());
}
            
@Bean
public CommonsMultipartResolver multipartResolver() {
CommonsMultipartResolver cm = new CommonsMultipartResolver();
cm.setMaxUploadSize(5008528);
return cm;
}
            
}