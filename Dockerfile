#--------------------------------Stage 1-----------------------------
FROM eclipse-temurin:21-jdk-jammy AS builder

WORKDIR /app

COPY . .

RUN ls -la && chmod +x mvnw && ./mvnw clean package -DskipTests -B

#--------------------------------Stage 2-----------------------------
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
