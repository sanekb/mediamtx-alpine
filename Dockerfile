ARG MEDIAMTX_VERSION=latest

FROM bluenviron/mediamtx:${MEDIAMTX_VERSION} AS mediamtx-builder

FROM alpine:3.21

RUN apk update && apk add --no-cache curl=8.14.1-r2

COPY --from=mediamtx-builder /mediamtx /usr/bin/mediamtx

ENTRYPOINT ["/usr/bin/mediamtx"]
