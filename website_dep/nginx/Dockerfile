# Use Alpine Linux as base image
FROM alpine:3.12

# Update package repository and install nginx
RUN apk update && \
    RUN apk add --no-cache nginx

# Expose port 80
EXPOSE 80

# Command to start Nginx when container starts
CMD ["nginx", "-g", "daemon off;"]

