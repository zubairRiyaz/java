# base image
FROM openjdk:latest
COPY . src/java
WORKDIR src/java
RUN ["javac", "App.java"]
ENTRYPOINT ["java", "App"]
