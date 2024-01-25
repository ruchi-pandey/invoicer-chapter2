FROM golang:latest
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

COPY  C:/Users/ruchi.pandey/go/bin/invoicer /app/invoicer
USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /app/invoicer
