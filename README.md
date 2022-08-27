# README

Dockerfile for [sqlboiler](https://github.com/volatiletech/sqlboiler)

```sh
$ docker run --rm -it -v ${PWD}:/ws --network host takekazuomi/sqlboiler
```

## Build

```sh
$ make build IMAGE_NAME=<yourname>/sqlboiler
```

## Push

```sh
$ make push IMAGE_NAME=<yourname>/sqlboiler
```

