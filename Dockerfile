# base image
FROM openjdk:latest
COPY . /src/main/java/App.java
WORKDIR /src/main/java/App.java
RUN ["javac", "App.java"]
ENTRYPOINT ["app", "APP.java"]
