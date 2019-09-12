# syntax=docker/dockerfile:1.0.0-experimental

FROM nginx:1.17.3-alpine

RUN addgroup -g 1000 app \
    && adduser -u 1000 -D -G app app \
    && mkdir -p /opt/project \
    && chown -R app:app /opt/project

WORKDIR /opt/project

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --chown=app:app ./src /opt/project
