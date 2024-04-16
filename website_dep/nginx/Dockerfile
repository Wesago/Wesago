# Use an official Nginx runtime as the base image
FROM nginx:alpine

# Copy the static files of the React app into the Nginx document root
COPY ../../website/build/ /usr/share/nginx/html

# Expose the port Nginx will listen on
EXPOSE 80
