package com.example.hellospring;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@Slf4j
public class HelloController {

    @RequestMapping("/")
    public String index() {
        log.trace("!!! trace !!!");
        log.debug("!!! debug !!!");
        log.info("!!! info !!!");
        log.warn("!!! warn !!!");
        log.error("!!! error !!!");
        return "Greetings from Azure Spring Cloud!, changed";
    }

}