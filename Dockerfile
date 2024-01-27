FROM node:lts-slim
WORKDIR /app
COPY package*.json .
COPY tsconfig.json .
RUN npm install
CMD [ "npm", "run", "start" ]