package md.rest_client.scheduler;

import org.quartz.JobDetail;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

@Configuration
public class GreetingConfiguration {

    @Bean
    public RestTemplate template(final RestTemplateBuilder builder) {
        return builder.build();
    }

    @Bean
    public JobDetail greetingJobDetail() {
        return newJob().
                ofType(GreetingJob.class).
                storeDurably().
                build();
    }

    @Bean
    public SimpleScheduleBuilder everySecond() {
        return simpleSchedule().
                repeatForever().
                withIntervalInSeconds(1);
    }

    @Bean
    public Trigger greetingJobTrigger(
            final JobDetail greetingJobDetail,
            final SimpleScheduleBuilder everySecond
    ) {
        return newTrigger().
                forJob(greetingJobDetail).
                withSchedule(everySecond).
                build();
    }
}
