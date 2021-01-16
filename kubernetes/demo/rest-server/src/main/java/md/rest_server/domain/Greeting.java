package md.rest_server.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import static javax.persistence.GenerationType.AUTO;

@Entity
@Data
public class Greeting {

    @Id
    @GeneratedValue(strategy= AUTO)
    private long id;

    private String content;

    public Greeting(String content) {
        this.content = content;
    }

    protected Greeting() {
    }
}
