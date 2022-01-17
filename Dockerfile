# base image
FROM openjdk:latest
ADD /target/my-app-1.0-SNAPSHOT.jar my-app.jar
RUN javac -jar my-app.jar
CMD java -jar /my-app.jar

