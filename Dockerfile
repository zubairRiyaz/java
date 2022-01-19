FROM maven:3.6.3-jdk-11-slim@sha256:68ce1cd457891f48d1e137c7d6a4493f60843e84c9e2634e3df1d3d5b381d36c AS build
RUN mkdir /project
COPY . /project
WORKDIR /project
RUN mvn clean package -DskipTests

# base image
FROM openjdk:latest
RUN mkdir /app
ADD /target/my-app-1.0-SNAPSHOT.jar /app/my-app-1.0-SNAPSHOT.jar
WORKDIR /app
RUN java -cp my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
CMD "java" "-jar" "my-app-1.0-SNAPSHOT.jar"
