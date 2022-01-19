FROM maven:3.6.3-jdk-11-slim@sha256:68ce1cd457891f48d1e137c7d6a4493f60843e84c9e2634e3df1d3d5b381d36c AS build
WORKDIR /workspace/app
COPY pom.xml .
COPY mvnw .
RUN mvn clean package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM adoptopenjdk/openjdk11:alpine-slim
VOLUME /tmp
COPY --from=build /workspace/app/target/my-app-1.0-SNAPSHOT.jar /app/my-app-1.0-SNAPSHOT.jar
RUN chmod 666 /app/my-app-1.0-SNAPSHOT.jar
CMD "java" "-jar" "my-app-1.0-SNAPSHOT.jar"

