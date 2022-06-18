# FROM strapi/base
# # ENV NODE_VERSION=16.15.1
# CMD ["node","-v"]
# WORKDIR /srv/app
# VOLUME [/srv/app]
# COPY ./package.json ./
# RUN yarn install && yarn cache clean --force
# COPY . .
# ENV NODE_ENV development
# RUN yarn build
# EXPOSE 1337
# CMD ["yarn", "develop"]

FROM node:16
# Installing libvips-dev for sharp Compatability
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /srv/app
COPY ./package.json ./
ENV PATH /srv/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /srv/app
COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]

