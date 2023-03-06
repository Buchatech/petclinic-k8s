FROM openjdk:latest

VOLUME /tmp

COPY ./target/spring-petclinic-3.0.0-SNAPSHOT.jar /

EXPOSE 8080
	
CMD ["java", "-jar", "/spring-petclinic-3.0.0-SNAPSHOT.jar"]
