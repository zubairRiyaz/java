# base image
FROM openjdk:latest
RUN mkdir /app
ADD /target/my-app-1.0-SNAPSHOT.jar /app/my-app.jar
WORKDIR /app
CMD java -jar /my-app.jar

