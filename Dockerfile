FROM alpine:latest
LABEL maintainer "kellyferrone@gmail.com"

RUN addgroup -S icecast && \
    adduser -S icecast
    
RUN apk add --update \
        icecast \
        mailcap && \
    rm -rf /var/cache/apk/*

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["icecast"]
CMD -c /etc/icecast.xml