FROM maven:latest AS build
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn package --file pom.xml

FROM openjdk:latest
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]