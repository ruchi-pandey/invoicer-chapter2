FROM golang:latest
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

COPY go/bin/invoicer /app/invoicer

RUN chmod +x /app/invoicer

USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /app/invoicer