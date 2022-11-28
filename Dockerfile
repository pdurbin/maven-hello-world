FROM openjdk:8-jdk-alpine3.9
RUN useradd -m user && passwd -d user
COPY ./my-app/target/my-app* target/
USER user
CMD java -jar /target/*.jar ; sleep 100000000
