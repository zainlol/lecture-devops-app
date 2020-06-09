FROM alpine:3.7
RUN apk add --no-cache make
WORKDIR app
COPY . app
RUN make install-deps 
RUN make run-local
