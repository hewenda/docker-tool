FROM alpine:3.21

RUN apk add --no-cache \
    openvpn \
    ca-certificates \
    tzdata

CMD ["openvpn", "--config", "/vpn/client.ovpn"]