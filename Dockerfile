FROM maven:3-jdk-8-alpine AS build
ADD . /my-app
WORKDIR /my-app
RUN mvn compile
RUN mvn package

FROM openjdk:8-jdk-alpine
ARG fullname
RUN addgroup -S appgroup && adduser -S zorki -G appgroup
USER zorki
COPY --from=build /my-app/target/${fullname}.jar ${fullname}.jar
ENV fulljar=${fullname}.jar
CMD exec java -jar ${fulljar}
