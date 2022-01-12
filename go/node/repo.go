package node

import ipfsrepo "github.com/ipfs/go-ipfs/repo"


type RepoMobile struct {
	ipfsrepo.Repo

	Path string
}

func NewRepoMobile(path string, repo ipfsrepo.Repo) *RepoMobile {
	return &RepoMobile{
		Repo: repo,
		Path: path,
	}
}