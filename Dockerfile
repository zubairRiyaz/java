FROM adoptopenjdk/openjdk11:alpine-slim as build
WORKDIR /workspace/app
COPY pom.xml .
COPY mvnw .
RUN mvn clean package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

FROM adoptopenjdk/openjdk11:alpine-slim
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-Dserver.port=${PORT}","-cp","app:app/lib/*","com.mycompany.app.App"]

