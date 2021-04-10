FROM golang:alpine as builder
RUN apk --no-cache add build-base git gcc
ADD . .
RUN go build -o /hello main.go

FROM alpine
ENV GOTRACEBACK=single
COPY --from=builder /hello .
CMD ["./hello"]
