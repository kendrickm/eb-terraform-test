FROM node:8.16.2-alpine

EXPOSE 3000

ADD app /app
WORKDIR /app
RUN npm install

CMD npm start
