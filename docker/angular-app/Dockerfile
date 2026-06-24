# Stage 1 - build the artifacts 
FROM node:24-slim AS builder

WORKDIR /build-app

COPY package*.json .

RUN npm ci --legacy-peer-deps

COPY . . 

RUN npm run build --omit=dev

# Stage 2 - Contains only Application code and a http server 
FROM alpine:3.14 

RUN apk add --no-cache busybox-extras

WORKDIR /app

COPY --from=builder /build-app/dist/browser .

EXPOSE 8000

CMD ["httpd", "-f", "-p", "8000"]




