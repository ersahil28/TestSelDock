#FROM adoptopenjdk/opendk17:jre-17.0.8_10-alpine

FROM eclipse-temurin:17.0.8_7-jre

WORKDIR /usr/share/udemy

ADD target/selenium-docker.jar               selenium-docker.jar
ADD target/selenium-docker-tests.jar         selenium-docker-tests.jar
ADD target/libs                              libs


ADD book-flight-module.xml                  book-flight-module.xml

ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DBROWSER=$BROWSER -DHUB_HOST org.testng.TestNG $MODULE