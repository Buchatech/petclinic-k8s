# https://www.dev-eth0.de/2019/07/29/dockerize-spring-boot-applications/

FROM openjdk:latest

VOLUME /tmp

COPY ./target/spring-petclinic-3.0.0-SNAPSHOT.jar /

EXPOSE 8080
	
CMD ["java", "-jar", "/spring-petclinic-3.0.0-SNAPSHOT.jar"]