FROM golang:1.12-alpine AS build
#Install git
RUN apk add --no-cache git
#Get the hello world package from a GitHub repository
RUN go get github.com/Sujagi02/Weather-API-Application
WORKDIR /go/src/github.com/Sujagi02/Weather-API-Application
# Build the project and send the output to /bin/HelloWorld 
RUN go build -o /bin/WeatherApp

FROM golang:1.12-alpine
#Copy the build's output binary from the previous build container
COPY --from=build /bin/WeatherApp /bin/WeatherApp
ENTRYPOINT ["/bin/WeatherApp"]