package com.traveleasy.starter;

import javax.annotation.Resource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import com.traveleasy.service.AmazonClientService;

@SpringBootApplication
@EntityScan("com.traveleasy.model")
@EnableJpaRepositories("com.traveleasy.repository")
@ComponentScan(basePackages = {  "com.traveleasy.controller","com.traveleasy.service", "com.traveleasy.config"})
public class Application  {
	
	@Resource
	AmazonClientService amazonClientService;

	public static void main(String[] args) {
		
		SpringApplication.run(Application.class, args);

	}
	
//	@Override
//	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//		return application.sources(Application.class);
//	}

}

