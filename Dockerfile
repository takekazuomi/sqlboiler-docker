FROM golang:1.17.2-alpine3.14  AS builder
ARG SQLBOILER_VER

RUN go install github.com/volatiletech/sqlboiler/v4@${SQLBOILER_VER} \
    && go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-psql@${SQLBOILER_VER} \
    && go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql@${SQLBOILER_VER} \
    && go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mssql@${SQLBOILER_VER}

FROM alpine:3.14
COPY --from=builder /go/bin/sqlboiler* /go/bin/

WORKDIR /ws
ENV PATH $PATH:/go/bin

ENTRYPOINT ["/go/bin/sqlboiler"]
