FROM node:16-alpine
# FROM strapi/base
# RUN node -v
WORKDIR /srv/app
COPY ./package.json /srv/app
RUN yarn install && yarn cache clean --force
COPY . /srv/app
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
