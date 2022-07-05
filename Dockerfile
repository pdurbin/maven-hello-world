# build artifact with maven
FROM maven:3-jdk-8-alpine AS BUILD_IMAGE
ADD . /my-app
WORKDIR /my-app
RUN mvn compile
RUN mvn package

# copy into the contanier and run it
FROM openjdk:8-jdk-alpine
# ARG artifact
COPY --from=BUILD_IMAGE /my-app/target/my-app*.jar .
RUN ls && pwd
# ENV ART=${artifact}.jar
# RUN echo ${ART}
RUN java -cp my-app*.jar com.mycompany.app.App
CMD exec java -jar my-app*.jar
