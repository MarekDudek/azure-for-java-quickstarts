FROM openjdk

COPY ./app/target/app-1.0-SNAPSHOT.jar /usr/src/app/app.jar

WORKDIR /usr/src/app

CMD ["java", "-cp", "./app.jar", "app.StatefulStepper", "./state.txt"]
