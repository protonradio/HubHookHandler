FROM node:10.18.1-alpine

RUN apk add --no-cache \
    curl \
    python \
    make \
    git \
    g++ \
    openssh \
    sshpass

RUN npm install -g npm

RUN mkdir /app
WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install --production

COPY lib lib
COPY index.js .

EXPOSE 3000

ENTRYPOINT ["yarn", "start"]
