# Implementación de build multi-pasos

FROM node:alpine as build

WORKDIR '/app'

COPY package.json .
RUN npm install
#COPY . . Copiar todo mi source code    
COPY . . 
RUN npm run build

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html

