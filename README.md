# docker-remodex-relay

This project packages the `relay` module from [remodex](https://github.com/Emanuele-web04/remodex) as a Docker image.  
Docker Hub image: `undirectlookable/remodex-relay`

## Run with `docker run`

```bash
docker run -it --rm -p 9000:9000 undirectlookable/remodex-relay:latest
```

## Run with Docker Compose

```yaml
services:
  remodex-relay:
    image: undirectlookable/remodex-relay:latest
    ports:
      - "9000:9000"
    restart: unless-stopped
```

Start:

```bash
docker compose up -d
```

## Security Note (Public Network)

If you expose this service on a public network, you **must** place it behind a reverse proxy (such as Nginx, Caddy, or Traefik) with HTTPS/TLS enabled.  
Do not expose port `9000` directly to the public internet.
