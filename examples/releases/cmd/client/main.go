package main

import (
	"context"
	"crypto/tls"
	"flag"
	"fmt"
	"log"
	"sort"

	pb "github.com/marceloaguero/grpc/examples/releases/pkg/pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

var target = flag.String("l", ":7100", "Specify the port that the server is listening on")

type byVersion []*pb.ReleaseInfo

func (b byVersion) Len() int           { return len(b) }
func (b byVersion) Swap(i, j int)      { b[i], b[j] = b[j], b[i] }
func (b byVersion) Less(i, j int) bool { return b[i].GetVersion() < b[j].GetVersion() }

func main() {
	flag.Parse()

	// Create TLS credentials
	creds := credentials.NewTLS(&tls.Config{
		InsecureSkipVerify: true,
	})

	conn, err := grpc.Dial(*target,
		grpc.WithTransportCredentials(creds),
	)

	if err != nil {
		log.Fatalf("grpc.Dial err: %v", err)
	}

	client := pb.NewGoReleasesClient(conn)

	ctx := context.Background()
	rsp, err := client.ListReleases(ctx, &pb.ListReleasesRequest{})
	if err != nil {
		log.Fatalf("ListReleases err: %v", err)
	}

	releases := rsp.GetReleases()
	if len(releases) > 0 {
		sort.Sort(byVersion(releases))
		fmt.Printf("Version\tRelease Date\tRelease Notes\n")
	} else {
		fmt.Println("No releases found")
	}

	for _, ri := range releases {
		fmt.Printf("%s\t%s\t%s\n",
			ri.GetVersion(),
			ri.GetReleaseDate(),
			ri.GetReleaseNotesUrl())
	}
}
