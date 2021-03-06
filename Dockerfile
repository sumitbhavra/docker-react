FROM node:14-alpine3.10

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
