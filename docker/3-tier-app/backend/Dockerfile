FROM node:16-slim

WORKDIR /app

COPY package*.json .

RUN npm ci --omit=dev

COPY . . 
 
EXPOSE 8000

CMD ["npm", "start"]