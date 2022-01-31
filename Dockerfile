FROM alpine:latest

RUN apk update && apk add tinyproxy
COPY conf-extensions /

RUN sed -i  -e '/^Allow /s/^/#/' \
            -e '/^ConnectPort /s/^/#/' \
            /etc/tinyproxy/tinyproxy.conf \
 && cat conf-extensions >> /etc/tinyproxy/tinyproxy.conf 


USER tinyproxy
ENTRYPOINT ["tinyproxy"]
CMD ["-d"]

