# Use the official Alpine Linux as a parent image
FROM alpine:3.19

# Install nginx
RUN apk update
RUN apk add --no-cache --update nginx openssl

# Create a directory to hold the certificate and key
RUN mkdir -p /etc/nginx/ssl

RUN  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nmunir.key -out /etc/nginx/ssl/nmunir.crt \
    -subj "/C=AE/ST=Abu Dhabi/L=Abu Dhabi/O=42/CN=nmunir"

# Copy the custom server definition file from your host to the container
COPY conf/default.conf /etc/nginx/http.d/default.conf

# Expose port 443
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
