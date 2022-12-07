# define args
ARG BUILD_IMAGE=maven:3
ARG RUNTIME_IMAGE=openjdk:11-jdk-slim
ARG HOME_PATH_ON_IMAGE=/maven-hello-world

#build stage.
FROM ${BUILD_IMAGE} as build_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
COPY . ${APP_HOME_ON_IMAGE}
RUN mvn -B compile -e -f pom.xml

#package stage.
FROM build_stage AS package_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
RUN mvn -B package -e -f pom.xml

#app stage
FROM ${RUNTIME_IMAGE} AS app_stage
WORKDIR ${HOME_PATH_ON_IMAGE}
COPY --from=package_stage target/my-app*.jar ${HOME_PATH_ON_IMAGE}
CMD java -jar my-app*.jar