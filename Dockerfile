# build artifact with maven
FROM maven:3-jdk-8-alpine AS BUILD_IMAGE
ADD . /my-app
WORKDIR /my-app
RUN mvn compile
RUN mvn package

# copy into the contanier and run it
FROM openjdk:8-jdk-alpine
# ARG artifact
ARG fullname
RUN addgroup -S appgroup && adduser -S zorki -G appgroup
USER zorki
# COPY --from=BUILD_IMAGE /my-app/target/my-app*.jar .
COPY --from=BUILD_IMAGE /my-app/target/${fullname}.jar ${fullname}.jar
RUN ls && pwd
# ENV ART=${artifact}.jar
# RUN echo ${ART}
# CMD exec java -jar my-app*.jar
ENV fulljar=${fullname}.jar
RUN java -jar ${fulljar}
CMD exec java -jar ${fulljar}
