# Use an existing docker image as base
FROM node:16.14.0-alpine

# EXPOSE 8080

WORKDIR /usr/app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# Download and install dependencies
COPY ./package.json ./
RUN npm install
RUN npm install @vue/cli@5.0.1 -g

# RUN mkdir /usr/app/node_modules/.cache && chmod -R 777 /usr/app/node_modules/.cache

COPY ./ ./

# Starting image container instructions
CMD ["npm", "run", "serve"]

