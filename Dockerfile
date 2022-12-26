FROM node:18.04:alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:1.21.3-alpine
COPY --from=build /app/dist /usr/share/nginx/html
