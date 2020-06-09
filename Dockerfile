FROM alpine:3.7
RUN apk add bash
RUN apk add --no-cache make
COPY . .
RUN make install-deps 
RUN make run-local
