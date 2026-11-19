FROM golang:1.27.3-alpine3.24 AS build
WORKDIR /src
COPY go.mod main.go ./
RUN go mod tidy && CGO_ENABLED=0 go build -mod=readonly -trimpath -o /sample .

FROM scratch
COPY --from=build /sample /sample
USER 65532:65532
ENTRYPOINT ["/sample"]
