FROM python:3.6.8-alpine3.9

ENV LANG C.UTF-8
ENV APP_ROOT /twoot

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}

RUN apk update && apk upgrade
RUN apk add --update --no-cache --virtual=build-dependencies build-base libffi-dev openssl-dev

ADD setup.py ${APP_ROOT}
ADD twoot.py ${APP_ROOT}

RUN python3 ${APP_ROOT}/setup.py install
