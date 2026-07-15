FROM alpine:3.21

RUN apk add --no-cache \
    openvpn \
    ca-certificates \
    tzdata

ENTRYPOINT ["openvpn"]
CMD ["--config", "/vpn/client.ovpn"]