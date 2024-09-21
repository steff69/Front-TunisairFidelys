# Use an official lightweight Alpine Linux image as the base
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the APK from your local build output into the Docker container
COPY ../build/app/outputs/flutter-apk/app-release.apk /app/app-release.apk

# Expose port 8080 to access the APK from outside the container
EXPOSE 8080

# Install a lightweight HTTP server to serve the APK
RUN apk add --no-cache darkhttpd

# Start the server to serve the APK at http://localhost:8080/app-release.apk
CMD ["darkhttpd", "/app", "--port", "8080"]
