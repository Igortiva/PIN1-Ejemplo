FROM node:11.1.0-alpine

WORKDIR /app

ADD package-lock.json package.json /app/
RUN npm install
EXPOSE 3000

ADD . /app

CMD ["npm", "test"]