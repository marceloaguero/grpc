package main

import (
	"context"
	"fmt"
	"log"
	"net"

	pb "github.com/marceloaguero/grpc/examples/helloworld/server/pb"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/reflection"
)

const (
	listenHost = "localhost"
	port       = "50052"
	certCrt    = "cert/server.crt"
	certCsr    = "cert/server.csr"
	certKey    = "cert/server.key"
)

type server struct{}

func (s *server) SayHello(ctx context.Context, req *pb.HelloRequest) (*pb.HelloResponse, error) {
	return &pb.HelloResponse{Message: "Hello " + req.Name}, nil
}

func (s *server) SayHelloAgain(ctx context.Context, req *pb.HelloRequest) (*pb.HelloResponse, error) {
	return &pb.HelloResponse{Message: "Hello again " + req.Name}, nil
}

func main() {
	lis, err := net.Listen("tcp", fmt.Sprintf("%s:%s", listenHost, port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	// Create TLS credentials
	creds, err := credentials.NewServerTLSFromFile(certCrt, certKey)
	if err != nil {
		log.Fatalf("could not load TLS keys: %v", err)
	}

	// Create an array of gRPC options with credentials
	opts := []grpc.ServerOption{grpc.Creds(creds)}

	s := grpc.NewServer(opts...)
	pb.RegisterGreeterServer(s, &server{})
	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
