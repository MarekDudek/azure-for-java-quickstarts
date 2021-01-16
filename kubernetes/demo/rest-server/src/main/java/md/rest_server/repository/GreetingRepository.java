package md.rest_server.repository;

import md.rest_server.domain.Greeting;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GreetingRepository extends CrudRepository<Greeting, Long> {
    Greeting findById(long id);
    List<Greeting> findByContent(String content);
}