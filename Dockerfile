FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app

COPY . ./
RUN mvn -B clean package

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /app

COPY --from=build-env /app/target/my-app-1.0.0.jar ./my-app-1.0.0.jar
CMD ["/usr/bin/java", "-jar", "/app/my-app-1.0.0.jar"]
