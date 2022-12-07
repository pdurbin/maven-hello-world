# define args
ARG BUILD_IMAGE=maven:3
ARG RUNTIME_IMAGE=openjdk:11-jdk-slim
ARG HOME_PATH_ON_IMAGE=/maven-hello-world
ARG VERSION_NUM=1.0.0

#build stage.
FROM ${BUILD_IMAGE} as build_stage 
WORKDIR ${HOME_PATH_ON_IMAGE}
COPY . ${APP_HOME_ON_IMAGE}
RUN mvn -B compile -e -f pom.xml

#set version stage
FROM build_stage AS version_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
RUN mvn versions:set -DnewVersion=${VERSION_NUM}

#package stage.
FROM version_stage AS package_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
RUN mvn -B package -e -f pom.xml

#app stage
FROM ${RUNTIME_IMAGE} AS app_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
ENV VERSION_NUM=${VERSION_NUM}
COPY --from=package_stage target/my-app-${VERSION_NUM}.jar ${HOME_PATH_ON_IMAGE}
#CMD java -jar my-app-*.jar
CMD ["/usr/bin/java", "-jar", "my-app-1.0.0.jar"]