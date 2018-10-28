package main

import (
	"context"
	"crypto/tls"
	"encoding/json"
	"flag"
	"io/ioutil"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"

	pb "github.com/marceloaguero/grpc/examples/releases/pkg/pb"
)

var listenPort = flag.String("l", ":7100", "Specify the port that the server will listen on")

type releaseInfo struct {
	ReleaseDate     string `json:"release_date"`
	ReleaseNotesURL string `json:"release_notes_url"`
}

/* goReleaseService implements GoReleaseServiceServer as defined in the generated code:

// GoReleasesServer is the server API for GoReleases service.
type GoReleasesServer interface {
	GetReleaseInfo(context.Context, *GetReleaseInfoRequest) (*ReleaseInfo, error)
	ListReleases(context.Context, *ListReleasesRequest) (*ListReleasesResponse, error)
}

*/

type goReleaseServer struct {
	releases map[string]releaseInfo
}

func (g *goReleaseServer) GetReleaseInfo(ctx context.Context, req *pb.GetReleaseInfoRequest) (*pb.ReleaseInfo, error) {
	version := req.GetVersion()

	ri, ok := g.releases[version]
	if !ok {
		return nil, status.Errorf(codes.NotFound, "release version %s not found", version)
	}

	return &pb.ReleaseInfo{
		Version:         version,
		ReleaseDate:     ri.ReleaseDate,
		ReleaseNotesUrl: ri.ReleaseNotesURL,
	}, nil
}

func (g *goReleaseServer) ListReleases(ctx context.Context, req *pb.ListReleasesRequest) (*pb.ListReleasesResponse, error) {
	var releases []*pb.ReleaseInfo

	for k, v := range g.releases {
		ri := &pb.ReleaseInfo{
			Version:         k,
			ReleaseDate:     v.ReleaseDate,
			ReleaseNotesUrl: v.ReleaseNotesURL,
		}
		releases = append(releases, ri)
	}

	return &pb.ListReleasesResponse{
		Releases: releases,
	}, nil
}

func main() {
	flag.Parse()
	svc := &goReleaseServer{
		releases: make(map[string]releaseInfo),
	}

	jsonData, err := ioutil.ReadFile("../../data/releases.json")
	if err != nil {
		log.Fatalf("failed to read data file: %v", err)
	}

	// Read releases from JSON data file
	err = json.Unmarshal(jsonData, &svc.releases)
	if err != nil {
		log.Fatalf("failed to marshal release data: %v", err)
	}

	// Prepate TLS config
	tlsCert := "../../certs/demo.crt"
	tlsKey := "../../certs/demo.key"
	cert, err := tls.LoadX509KeyPair(tlsCert, tlsKey)
	if err != nil {
		log.Fatalf("failed to load cert: %v", err)
	}

	// Create TLS credentials
	creds := credentials.NewTLS(&tls.Config{
		Certificates: []tls.Certificate{cert},
	})

	// Create gRPC server with transport credentials
	s := grpc.NewServer(
		grpc.Creds(creds),
	)

	lis, err := net.Listen("tcp", *listenPort)
	if err != nil {
		log.Fatalf("failed to listen %v", err)
	}

	log.Println("Listening on ", *listenPort)

	pb.RegisterGoReleasesServer(s, svc)
	reflection.Register(s)

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
