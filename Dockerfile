FROM node:14.4.0-stretch-slim
# FROM mhart/alpine-node
  
COPY . /app


CMD node /app/app.js

EXPOSE  3000
