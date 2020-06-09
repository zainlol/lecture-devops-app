# Use a lighter version of Node as a parent image
FROM mhart/alpine-node:8.11.4
# Set the working directory to /app/server
RUN apk add make
RUN make install-deps 
RUN make run-local
