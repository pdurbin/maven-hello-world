# Build Stage
ARG PATCH_VERSION
ENV JAR_PATCH_VERSION=$PATCH_VERSION

FROM maven:3.6.3-jdk-8 AS build-env
WORKDIR /app
COPY . ./
RUN mvn versions:set -Dversion=1.0.${PATCH_VERSION} && \
    mvn -B clean package

# Final Image
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build-env /app/target/*.jar ./
CMD ["sh", "-c", "java -jar my-app.1.0.${JAR_PATCH_VERSION}.jar"]
