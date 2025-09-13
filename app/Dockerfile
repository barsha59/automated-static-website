# Use the official lightweight Nginx image as the base
FROM nginx:alpine

# Remove the default Nginx HTML page
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom 'index.html' to the container's Nginx serving directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 for the web server to listen on
EXPOSE 80