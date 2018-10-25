package main

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"

	pb "github.com/marceloaguero/grpc/examples/releases/pkg/pb"
)

const (
	port = ":50051"
)

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
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen %v", err)
	}

	log.Println("Listening on ", port)

	s := grpc.NewServer()
	pb.RegisterGoReleasesServer(s, &goReleaseServer{})
	reflection.Register(s)

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
