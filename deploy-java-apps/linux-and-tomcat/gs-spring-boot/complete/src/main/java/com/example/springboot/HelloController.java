package com.example.springboot;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@Slf4j
public class HelloController {

	@RequestMapping("/")
	public String index() {
		log.info("controller run");
		log.debug("controller run, debug");
		return "Hello, Azure!";
	}
}
