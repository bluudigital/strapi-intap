FROM strapi/base
WORKDIR /srv/app
COPY ./package.json ./
RUN yarn install && yarn cache clean --force
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
