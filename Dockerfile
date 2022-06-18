FROM node:16-alpine
FROM strapi/base
RUN node -v
WORKDIR /srv/app
COPY ./package.json ./
RUN yarn cache clean --force && yarn install
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
