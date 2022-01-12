# base image
FROM openjdk:latest
COPY /src/main/java/App.java /var/www/java/App.java
WORKDIR /var/www/java 
CMD ["java", "App"] 
