#first satge of building angular image
FROM node:alpine3.15 as build
RUN mkdir -p /app

WORKDIR /app

COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run build --prod

#sunal stage
FROM nginx:alpine
COPY --from=build /app/dist/helpdesk /usr/share/nginx/html

