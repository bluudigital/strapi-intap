# FROM node:16-alpine
# # Installing libvips-dev for sharp Compatability
# RUN apt-get update && apt-get install libvips-dev -y
# RUN apk add --no-cache libc6-compat
# ARG NODE_ENV=development
# ENV NODE_ENV=${NODE_ENV}
# WORKDIR /srv/
# COPY ./package.json ./yarn.lock ./
# ENV PATH /srv/node_modules/.bin:$PATH
# RUN yarn config set network-timeout 600000 -g && yarn install
# WORKDIR /srv/app
# COPY ./ .
# RUN yarn build
# EXPOSE 1337
# CMD ["yarn", "develop"]

FROM node:16
# Installing libvips-dev for sharp Compatability
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
