FROM node:lts-alpine AS builder

RUN apk add --no-cache git

WORKDIR /src
RUN git clone --depth=1 --branch=main https://github.com/Emanuele-web04/remodex.git remodex

WORKDIR /src/remodex/relay
RUN npm install

FROM node:lts-alpine

WORKDIR /app
COPY --from=builder /src/remodex ./remodex

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["/app/entrypoint.sh"]
