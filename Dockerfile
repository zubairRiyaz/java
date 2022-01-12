# base image
FROM openjdk:latest
COPY . /SRC/main/java/com/app
WORKDIR /SRC/main/java/com/app
RUN ["javac", "App.java"]
