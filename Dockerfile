FROM python:3.8.5-alpine

RUN pip install -Iv xmlschema==1.2.4

RUN mkdir -p /data

WORKDIR /data

