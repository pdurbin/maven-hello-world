ARG MAVEN_SNAPSHOT_VERSION=1.0.0-SNAPSHOT
FROM openjdk:11-jdk-slim
WORKDIR /usr/local/service
ENV MAVEN_SNAPSHOT_VERSION=$MAVEN_SNAPSHOT_VERSION
RUN adduser iamnotroot
USER iamnotroot
COPY my-app/target/my-app-1.0.0-SNAPSHOT.jar /usr/local/service/my-app-1.0.0-SNAPSHOT.jar
CMD ["java","-jar","/usr/local/service/my-app-1.0.0-SNAPSHOT.jar"]
