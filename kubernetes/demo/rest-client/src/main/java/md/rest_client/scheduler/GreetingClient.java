package md.rest_client.scheduler;

import md.rest_client.domain.Greeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class GreetingClient {

    @Autowired
    private RestTemplate template;

    @Value("${greeting.url}")
    private String url;

    public Greeting getGreeting() {
        return template.getForObject(url, Greeting.class);
    }
}
