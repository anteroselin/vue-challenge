FROM node:16.18.1-slim

USER root

WORKDIR /app
COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build

ENV HOST 0.0.0.0

CMD ["npm", "run", "start"]