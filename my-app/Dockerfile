FROM maven:3.5.0-jdk-8-alpine AS builder

ADD ./pom.xml pom.xml
ADD ./src src/

RUN mvn clean package

From openjdk:8-jre-alpine

ARG VERSION

RUN adduser -u 8877 --disabled-password appUser 

USER appUser

COPY --from=builder target/my-app-${VERSION}.jar my-app.jar

CMD ["java", "-jar", "my-app.jar"]

