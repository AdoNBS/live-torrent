FROM node:12

LABEL maintainer "AdoNBS <ado@salkic.me>"
LABEL description "Build Filmovi-sa-prevodom-Online server image"
LABEL version "3.0"

WORKDIR /usr/src/app

COPY package*.json ./

ENV PORT 8080

RUN npm install

COPY . ./
RUN npm run build

ENV NODE_ENV production
RUN npm ci --only=production

EXPOSE 8080
CMD ["npm", "start"]
