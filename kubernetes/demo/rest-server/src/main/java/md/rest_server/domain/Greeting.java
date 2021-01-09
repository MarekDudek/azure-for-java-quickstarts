package md.rest_server.domain;

import lombok.Value;

@Value
public class Greeting {
    long id;
    String content;
}
