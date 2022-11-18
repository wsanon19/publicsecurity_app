FROM amazoncorretto:11-alpine-jdk
ARG JAR_FILE= build/libs/*.jar
COPY ${JAR_FILE} application.jar
ENTRYPOINT ["java", "-jar", "/application.jar"]
