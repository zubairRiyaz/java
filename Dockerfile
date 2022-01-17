# base image
FROM openjdk:latest
COPY . src/java
WORKDIR src/java
ADD /target/my-app-1.0-SNAPSHOT.jar my-app.jar
CMD java -jar /my-app.jar

