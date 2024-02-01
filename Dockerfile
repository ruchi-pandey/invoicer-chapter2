FROM golang:latest
RUN addgroup --gid 10001 app
RUN adduser --gid 10001 --uid 10001 \
    --home /app --shell /sbin/nologin \
    --disabled-password app

RUN mkdir /app/statics/
ADD statics /app/statics/

ADD . C:/Users/ruchi.pandey/Desktop/testing/Go/src/github.com/ruchi-pandey/invoicer
RUN go install github.com/ruchi-pandey/invoicer-chapter2/blob/master/invoicer.exe@latest

USER app
EXPOSE 8080
WORKDIR /app
ENTRYPOINT /go/bin/invoicer