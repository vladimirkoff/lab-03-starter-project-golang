FROM golang:latest as base

WORKDIR /app

COPY . .

RUN go mod download
RUN go get -d -v 

RUN CGO_ENABLED=0 go build -o build/fizzbuzz

FROM scratch

COPY --from=base /app .

CMD ["/build/fizzbuzz","serve"]