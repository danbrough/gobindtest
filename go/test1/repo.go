package main

import (
	ipfsrepo "github.com/ipfs/go-ipfs/repo"
	ipfsfsrepo "github.com/ipfs/go-ipfs/repo/fsrepo"
)

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

//export KRepoIsInitialized
func KRepoIsInitialized(path string) bool {
	return ipfsfsrepo.IsInitialized(path)
}
