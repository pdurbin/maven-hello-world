FROM maven:3.6.3-jdk-8 AS build-env
ARG PATCH_VERSION
WORKDIR /app
COPY . ./
RUN mvn versions:set -Dversion=1.0.${PATCH_VERSION} && \
    mvn -B clean package


FROM openjdk:8-jre-alpine
ARG PATCH_VERSION
WORKDIR /app
COPY --from=build-env /app/target/my-app.1.0.${PATCH_VERSION}.jar ./my-app.jar
CMD ["/usr/bin/java", "-jar", "/app/my-app.jar"]
