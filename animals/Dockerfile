FROM eclipse-temurin:11
RUN mkdir /opt/app
COPY build/libs/animals-0.0.1-SNAPSHOT.jar /opt/app/animals.jar
RUN ls -l /opt/app/animals.jar
CMD ["java", "-jar", "/opt/app/animals.jar"]
