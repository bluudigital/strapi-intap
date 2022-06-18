FROM strapi/base
ENV NODE_VERSION=16.15.1
WORKDIR /srv/app
COPY ./package.json ./
RUN yarn install && yarn cache clean --force
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
