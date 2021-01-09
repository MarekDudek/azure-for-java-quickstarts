package md.rest_client;

import md.rest_client.client.GreetingClient;
import md.rest_client.domain.Greeting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import static java.lang.System.out;

@SpringBootApplication
public class SpringBootKubernetesDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootKubernetesDemoApplication.class, args);
	}

	@Autowired
	private GreetingClient client;

	@Bean
	public CommandLineRunner run() {
		return args -> {
			final Greeting greeting = client.getGreeting();
			out.println(greeting);
		};
	}
}
