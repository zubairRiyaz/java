# base image
FROM openjdk:latest
RUN mkdir /app
ADD /target/my-app-1.0-SNAPSHOT.jar /app/my-app-1.0-SNAPSHOT.jar
WORKDIR /app
CMD java -jar /app/my-app-1.0-SNAPSHOT.jar

