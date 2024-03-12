package asm2.springweb.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;
import org.springframework.web.filter.GenericFilterBean;

@ComponentScan(basePackages = { "asm2.springweb" })
@EnableWebSecurity
@EnableGlobalMethodSecurity(proxyTargetClass=true, prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	};

	@Bean
	public DataSource createDataSource() {
	    DriverManagerDataSource dataSource = new DriverManagerDataSource();
	    dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
	    dataSource.setUrl("jdbc:mysql://localhost:3306/spring_workcv");
	    dataSource.setUsername("root");
//	    dataSource.setPassword("root");
	    return dataSource;
	}
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
//		.passwordEncoder(NoOpPasswordEncoder.getInstance())
		.passwordEncoder(new BCryptPasswordEncoder())
		.dataSource(createDataSource())
		.usersByUsernameQuery("select email, password, enabled from user where email= ?")
		.authoritiesByUsernameQuery("\r\n"
				+ "SELECT u.email, a.role_name " +
                "FROM user u " +
                "JOIN role a ON u.role_id = a.id " +
                "WHERE u.email = ?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.addFilterBefore(new EncodingFilter(), ChannelProcessingFilter.class);
		http.csrf().disable();
		http.authorizeRequests()
		
//		.antMatchers("/").authenticated()
//		.anyRequest().authenticated() // Yêu cầu đăng nhập cho tất cả các trang
		.antMatchers("/").permitAll()
		.and()
		.formLogin()
			.loginPage("/auth/login").usernameParameter("email").passwordParameter("password")
			.loginProcessingUrl("/authenticate")		
			.defaultSuccessUrl("/loginSuccess")
			.permitAll()
//			.successHandler((request, response, authentication) -> {
//			    String contextPath = request.getContextPath();
//			    response.sendRedirect(contextPath + "/");
//			})
		.and()
		.logout()
		.permitAll()
		.and()
		.exceptionHandling().accessDeniedPage("/access-denied");		
}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/static**");
	}
	
	class EncodingFilter extends GenericFilterBean {

		@Override
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
				throws IOException, ServletException {
			request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        chain.doFilter(request, response);
		}
	}

}
