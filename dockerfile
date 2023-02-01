FROM openjdk:11-jdk-slim
WORKDIR /usr/local/service
RUN adduser iamnotroot;echo 'iamnotroot:Password012#' | chpasswd
USER iamnotroot
COPY my-app/target/my-app-1.0.0-SNAPSHOT.jar /usr/local/service/my-app-1.0.0-SNAPSHOT.jar
CMD ["java","-jar","/usr/local/service/my-app-1.0.0-SNAPSHOT.jar"]
