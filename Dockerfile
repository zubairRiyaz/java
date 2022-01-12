# base image
FROM openjdk:latest
COPY */src/main/java/App.java /var/www/java  
WORKDIR /var/www/java 
RUN javac App.java  
CMD ["java", "App"] 
