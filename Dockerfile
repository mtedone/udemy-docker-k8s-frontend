# Build phase

FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . . 

# Generates /app/build on the container for React
RUN npm run build

# Run phase

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# CMD not needed as this is the default command for nginx

