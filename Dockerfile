FROM strapi/base
WORKDIR /srv/app
VOLUME /srv/app
COPY ./package.json ./
ARG CACHEBUST=1
RUN yarn install
COPY . .
ENV NODE_ENV development
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
