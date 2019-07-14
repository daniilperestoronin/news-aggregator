# build environment
FROM node:12.2.0-alpine as build
WORKDIR /app
COPY . /app
ARG REACT_APP_SOURCE_HOST=''
ARG REACT_APP_ARTICLE_HOST=''
RUN npm install 
RUN REACT_APP_SOURCE_HOST=${REACT_APP_SOURCE_HOST} REACT_APP_ARTICLE_HOST=${REACT_APP_ARTICLE_HOST} npm run build

FROM nginx:1.16.0-alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY conf/nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
