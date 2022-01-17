# base image
FROM openjdk:latest
COPY . src/java
WORKDIR src/java
RUN ["javac", "/src/main/java/App.java"]
ENTRYPOINT ["java", "App"]
