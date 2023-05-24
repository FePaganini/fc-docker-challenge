FROM golang AS go-builder

WORKDIR /go/app
COPY main.go .

RUN go mod init go-challenge
RUN go build -o fc-docker-go

FROM scratch
COPY --from=go-builder /go/app/fc-docker-go .
ENTRYPOINT [ "./fc-docker-go" ]