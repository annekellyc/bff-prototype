FROM node:lts

COPY server /usr/src/app/server/
COPY index.js /usr/src/app/
COPY package.json /usr/src/app/

WORKDIR /usr/src/app/

RUN npm install

EXPOSE 3000

CMD ["npm", "start"] 