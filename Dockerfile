FROM openjdk:11 AS TEMP_BUILD_IMAGE
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle gradlew $APP_HOME
COPY gradle $APP_HOME/gradle
COPY . .
RUN ./gradlew build

FROM openjdk:11
ENV ARTIFACT_NAME=forma_security-0.0.1-SNAPSHOT
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .
EXPOSE 8080
CMD ["java","-jar","/usr/app/forma_security-0.0.1-SNAPSHOT"]
