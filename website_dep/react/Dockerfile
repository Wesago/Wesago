# Use Node.js as base image
FROM node:lts-alpine3.19

# install pnpm
RUN npm install -g pnpm
# install git
RUN apk add --no-cache git

# get the source code
RUN git clone https://github.com/Wesago/wesago-website.git /project
WORKDIR /project

# install dependencies
RUN pnpm install
# build the project
RUN pnpm run build