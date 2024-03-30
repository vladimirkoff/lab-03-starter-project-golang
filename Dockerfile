FROM golang:latest

WORKDIR /app

COPY . .

RUN go mod download
RUN go get -d -v 

RUN go build -o build/fizzbuzz

CMD ["/build/fizzbuzz","serve"]