From redis:alpine3.19

COPY redis.conf /etc

# Expose the port the app runs on
# Default redis port is 6379
EXPOSE 6379

# Run the command to start redis server
CMD [ "redis-server", "/etc/redis.conf" ]
