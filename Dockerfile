FROM node:alpine as build-phase
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","run","build"]

FROM nginx
EXPOSE 8000
COPY --from=build-phase /app/build /usr/share/nginx/html