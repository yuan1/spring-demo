FROM openjdk:8-jre
MAINTAINER limy <mingyuan.li@linksfield.net>

ENV TZ=Asia/Shanghai \
    SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    APP_SLEEP=0

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8082

ARG JAR_FILE

ADD target/${JAR_FILE} /app.jar

CMD echo "The application will start in ${APP_SLEEP}s..." && \
    sleep ${APP_SLEEP} && \
    java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar
    # java ${JAVA_OPTS} -Djava.security.egd=environment:/dev/./urandom -jar /app.@project.packaging@
