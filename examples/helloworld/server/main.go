package main

import (
	pb "proto"
)

const (
	port = ":50051"
)

server struct{}

func (s *server) SayHello(ctx context.Context, *HelloRequest) (*HelloResponse, error)