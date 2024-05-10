FROM node:20.13.1-slim AS build

WORKDIR /dist/src/app

COPY . .
RUN npm install
RUN npm run build --prod
RUN ls -l



FROM nginx:latest AS ngi

COPY --from=build /dist/src/app/dist/cm2-dummy/browser /usr/share/nginx/html
COPY config/nginx/cm2-spa.conf  /etc/nginx/conf.d/default.conf

EXPOSE 80
