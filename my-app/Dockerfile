FROM maven:3.6.3-jdk-8-slim AS build
WORKDIR /app
COPY . /app
RUN mvn -f pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /app/target ./
ENTRYPOINT ["sh", "-c", "java -cp my-app-1.0.1-SNAPSHOT.jar com.mycompany.app.App"]

#TEST - 1

