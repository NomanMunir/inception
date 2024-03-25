# Use the official Alpine Linux as a parent image
FROM alpine:3.17

# Install nginx
RUN apk add --no-cache nginx

# Create a directory for PID file
RUN mkdir -p /run/nginx

# Remove the default server definition
RUN rm /etc/nginx/nginx.conf

# Copy the custom server definition file from your host to the container
COPY nginx.conf /etc/nginx/

# Create a directory to hold the certificate and key
RUN mkdir -p /etc/nginx/certs

# Copy the SSL certificate and key into the container
COPY ./certs/nginx-selfsigned.crt /etc/nginx/certs/nginx-selfsigned.crt
COPY ./certs/nginx-selfsigned.key /etc/nginx/certs/nginx-selfsigned.key

RUN mkdir /web

COPY index.html /web

# Expose port 80
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
