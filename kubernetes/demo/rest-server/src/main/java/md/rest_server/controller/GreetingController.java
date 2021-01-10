package md.rest_server.controller;

import md.rest_server.domain.Greeting;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

import static java.lang.String.format;

@RestController
public class GreetingController {

    private static final String TEMPLATE = "Hello, %s!";

    private final AtomicLong counter = new AtomicLong();

    @GetMapping("/greeting")
    public Greeting greeting(final @RequestParam(value = "name", defaultValue = "World") String name) {
        final long id = counter.incrementAndGet();
        final String content = format(TEMPLATE, name);
        return new Greeting(id, content);
    }
}
