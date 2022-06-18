FROM strapi/base
WORKDIR /srv/app
VOLUME /srv/app
COPY ./package.json ./
RUN yarn install --ignore-engines
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
