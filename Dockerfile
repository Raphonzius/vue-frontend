FROM node:lts-alpine AS build-stage
LABEL maintainer-name="Rafael Pereira"
LABEL maintainer-email="rafael.informa@gmail.com"
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
