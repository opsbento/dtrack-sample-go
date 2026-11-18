FROM golang:1.27.3-alpine3.24 AS build
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY main.go ./
RUN CGO_ENABLED=0 go build -mod=readonly -trimpath -o /sample .

FROM scratch
COPY --from=build /sample /sample
USER 65532:65532
ENTRYPOINT ["/sample"]
