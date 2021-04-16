# THIS IS A 2-STEP PROCESS

# STEP #1
FROM node:10-alpine

WORKDIR '/app'

COPY package.json ./
RUN npm install
COPY . .

RUN npm run build

# STEP #2
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html