package edu.mum.coffee.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers("/", "/home", "/index").permitAll().anyRequest().authenticated().and()
//				.formLogin().loginPage("/login")
//				.defaultSuccessUrl("/welcome")
//				// .failureUrl("/views/error.jsp")
//				.permitAll().and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//				.logoutSuccessUrl("/").permitAll();

		http.authorizeRequests()
				.antMatchers("/home").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
				.antMatchers("/user").access("hasRole('ROLE_USER')")
				.antMatchers("/welcome").access("hasRole('ROLE_ADMIN')").and()
				.formLogin().loginPage("/login")
				.defaultSuccessUrl("/welcome")
				.failureUrl("/login?error")
				.usernameParameter("username").passwordParameter("password").and().logout()
				.logoutSuccessUrl("/login?logout");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
				.withUser("user").password("user").authorities("ROLE_USER").and()
				.withUser("super").password("pw").authorities("ROLE_ADMIN");
	}

}
