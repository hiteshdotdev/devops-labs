# stage 1 - build the application 
FROM node:16-slim AS build

WORKDIR /app

COPY package*.json .

RUN npm ci

COPY . . 

RUN npm run build 

# stage 2 - copy only the final static files and serve them
FROM busybox:1.35

WORKDIR /prod

COPY --from=build /app/dist .

EXPOSE 3000

CMD ["busybox", "httpd", "-f", "-v", "-p", "3000"]