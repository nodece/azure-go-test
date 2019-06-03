FROM golang:latest as build-env
ADD . /app/
WORKDIR /app
RUN go mod download
RUN go build -o main .


FROM scratch
COPY --from=build-env /app/main /app/main
ENTRYPOINT ["/app/main"]