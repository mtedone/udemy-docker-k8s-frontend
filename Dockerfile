# Build phase

FROM node:alpine

WORKDIR /app

COPY package.json ./

RUN npm install 

COPY . . 

# Generates /app/build on the container for React
RUN npm run build

# Run phase

FROM nginx
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html

# CMD not needed as this is the default command for nginx

