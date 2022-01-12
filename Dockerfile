# base image
FROM openjdk:latest
COPY . /Src/main/java/com/app
WORKDIR /Src/main/java/com/app
RUN ["javac", "App.java"]
ENTRYPOINT ["app", "APP.java"]
