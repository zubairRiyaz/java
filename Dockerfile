# base image
FROM openjdk:latest
ADD /target/my-app-1.0-SNAPSHOT.jar app.jar
COPY /src/main/java/App.java /var/www/java/App.java
WORKDIR /var/www/java 
CMD ["java", "App"] 
