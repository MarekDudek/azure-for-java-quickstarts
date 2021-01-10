package md.rest_client.scheduler;

import lombok.extern.slf4j.Slf4j;
import md.rest_client.domain.Greeting;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class GreetingJob implements Job {

    @Autowired
    private GreetingClient client;

    @Override
    public void execute(final JobExecutionContext context) {
        final Greeting greeting = client.getGreeting();
        log.info("{}", greeting);
    }
}
