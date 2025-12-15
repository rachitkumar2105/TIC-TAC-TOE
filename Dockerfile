# ---------- BUILD STAGE ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml first (for dependency caching)
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn -B clean package -DskipTests


# ---------- RUNTIME STAGE ----------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the jar from build stage
COPY --from=build /app/target/tictactoe-1.0.0.jar app.jar

# Expose port (Render uses this)
EXPOSE 8080

# Run Spring Boot app
ENTRYPOINT ["java","-jar","/app/app.jar"]
