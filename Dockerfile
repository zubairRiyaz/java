# base image
FROM openjdk:latest
COPY . /SRC/java/App.java
WORKDIR /SRC/java/App.java
RUN ["javac", "App.java"]
ENTRYPOINT ["app", "APP.java"]
