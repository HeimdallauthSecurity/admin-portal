# Stage 1: Build the Angular application
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Install OpenSSL to generate certificates

# Copy the built Angular application from the builder stage
COPY --from=builder /app/dist/admin-portal/browser /usr/share/nginx/html

# Copy custom Nginx configuration

# Expose ports 80 and 443
EXPOSE 80

