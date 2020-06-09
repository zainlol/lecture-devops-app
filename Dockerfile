FROM alpine:3.7
RUN apk add bash
RUN apk add make
COPY . .
RUN make install-stack
RUN make install-deps 
RUN make run-local
