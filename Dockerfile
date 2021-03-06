FROM node:15.9.0-slim

WORKDIR /home/node/app
RUN chown -R node: /home/node/app
USER node

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
ENTRYPOINT ["npm"]
