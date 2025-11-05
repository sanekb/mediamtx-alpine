ARG MEDIAMTX_VERSION=latest

FROM bluenviron/mediamtx:${MEDIAMTX_VERSION} AS mediamtx-builder

FROM alpine:3.21

RUN apk add --no-cache curl

COPY --from=mediamtx-builder /mediamtx /usr/bin/mediamtx

ENTRYPOINT ["/usr/bin/mediamtx"]
