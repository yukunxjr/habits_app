FROM node:16.18.0-alpine

ENV HOME="/app" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

ENV HOST 0.0.0.0

WORKDIR ${HOME}

ADD . ${HOME}

RUN apk update && \
    apk upgrade && \
    npm install -g n && \
    yarn install && \
    rm -rf /var/cache/apk/* \
    yarn add yarn


EXPOSE 3000

RUN yarn run build

CMD ["yarn", "start"]
