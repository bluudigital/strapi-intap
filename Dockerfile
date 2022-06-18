FROM strapi/base
WORKDIR /srv/app
COPY ./package.json ./
RUN yarn install
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
