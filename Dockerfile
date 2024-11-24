# Use an official Nginx image as a parent image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the custom index.html to the container
COPY index.html .

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

