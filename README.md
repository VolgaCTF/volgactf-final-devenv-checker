# VolgaCTF Final devenv checker

[VolgaCTF Final devenv](https://github.com/VolgaCTF/volgactf-final-devenv) is a platform to develop & test an A/D CTF service and its checker.

This repository provides a Dockerfile for a sample service checker.

## Healthcheck (CI/CD)

```
$ docker run --env-file .env -p 8080:80 -d volgactf/volgactf-final-devenv-checker
$ curl -v -u volgactf:volgactf http://127.0.0.1:8080/healthcheck
```

## License
MIT @ [VolgaCTF](https://github.com/VolgaCTF)
