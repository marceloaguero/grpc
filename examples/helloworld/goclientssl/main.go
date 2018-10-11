package main

import (
	"context"
	"log"
	"os"
	"time"

	pb "github.com/marceloaguero/grpc/examples/helloworld/server/pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

const (
	address     = "localhost:50052"
	defaultName = "world"
	certCrt     = "cert/server.crt"
)

func main() {
	// Create the client TLS credentials
	creds, err := credentials.NewClientTLSFromFile(certCrt, "")
	if err != nil {
		log.Fatalf("could not load TLS cert: %v", err)
	}
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}

	defer conn.Close()

	c := pb.NewGreeterClient(conn)

	// Contact the server and print out the response
	name := defaultName
	if len(os.Args) > 1 {
		name = os.Args[1]
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	r, err := c.SayHello(ctx, &pb.HelloRequest{Name: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Greeting: %s", r.Message)

	r, err = c.SayHelloAgain(ctx, &pb.HelloRequest{Name: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Greeting: %s", r.Message)

}
