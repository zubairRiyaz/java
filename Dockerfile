# base image
FROM openjdk:latest
COPY . /var/www/java  
WORKDIR /var/www/java 
RUN javac App.java  
CMD ["java", "App"] 
