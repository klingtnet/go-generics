# Go Generics Playground

Run `build-go2go.sh` to compile a Go distribution with go2go support.
Here's a list of resources to refer to when having questions about generics draft:

- [Generics proposal blog post][proposal-blog]
- [various example packages using generics][generics-package-examples]
- [Type Parameters (Generics) Draft][draft]
- [go2go README][go2go-readme]

Note that generics source files use a `.go2` file extension.

```sh
$ go tool go2go
Usage: go2go <command> [arguments]

The commands are:

	build      translate and build packages
	run        translate and run list of files
	test       translate and test packages
	translate  translate .go2 files into .go files
```

Tool usage examples:

```sh
$ go tool go2go test chans
ok  	chans	(cached)
$ go tool go2go translate chans; ls $GO2PATH/src/chans/*.go
./goroot/src/cmd/go2go/testdata/go2path/src/chans/chans.go
./goroot/src/cmd/go2go/testdata/go2path/src/chans/chans_test.go
```

- `go tool go2go` does not support `-v` and other test flags yet
- it looks like all `go2go` subcommands were copied from `go list`:

```sh
$ go tool go2go test -h
usage: go list [-f format] [-json] [-m] [list flags] [build flags] [packages]
Run 'go help list' for details.
./goroot/bin/go list "-h" failed: exit status 2
```

- `any` is a shorthand for `interface{}`
- in a type parameter list the type parameter name is uppercased, e.g. `func f[T constraint](x T) {}`

[draft]: https://go.googlesource.com/proposal/+/refs/heads/master/design/go2draft-type-parameters.md
[generics-package-examples]: https://go.googlesource.com/go/+/refs/heads/dev.go2go/src/cmd/go2go/testdata/go2path/src
[proposal-blog]: https://blog.golang.org/generics-proposal
[go2go-readme]: https://go.googlesource.com/go/+/refs/heads/dev.go2go/README.go2go.md
