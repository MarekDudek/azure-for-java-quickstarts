FROM openjdk:8-jre-alpine
WORKDIR /app
EXPOSE 80
COPY ./gs-spring-boot/complete/target/spring-boot-0.0.1-SNAPSHOT.jar /app/application.jar
CMD ["/usr/bin/java", "-jar", "/app/application.jar"]
