

FROM node:14.17.3-alpine3.12 as firstContainer
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . . 
RUN yarn build

FROM nginx
COPY --from=firstContainer /app/build /usr/share/nginx/html
