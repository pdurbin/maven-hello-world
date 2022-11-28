FROM openjdk:8-jdk-alpine3.9
RUN  adduser -D user
COPY ./my-app/target/my-app* target/
USER user
CMD java -jar /target/*.jar 
