package md.rest_server.controller;

import md.rest_server.domain.Greeting;
import md.rest_server.repository.GreetingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static java.lang.String.format;

@RestController
public class GreetingController
{
    private static final String TEMPLATE = "Hello, %s!";

    @Autowired
    private GreetingRepository repository;

    @GetMapping("/greeting")
    public Greeting greeting
    (
            final @RequestParam(value = "name", defaultValue = "World") String name
    )
    {
        final String content = format(TEMPLATE, name);
        final Greeting greeting = new Greeting(content);
        repository.save(greeting);
        return greeting;
    }

    @GetMapping("/greeting/{id}")
    public Greeting greeting
    (
            final @PathVariable long id
    )
    {
        return repository.findById(id);
    }

    @GetMapping("/content")
    public List<Greeting> greetingByContent
            (
                    final @RequestParam(value = "content") String content
            )
    {
        return repository.findByContent(content);
    }
}
