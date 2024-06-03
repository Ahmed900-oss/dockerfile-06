###################################################################
# This is templating file of Dockerfile. It will help you to      #
# complete all required instructions for building the Dockerfile. #
###################################################################

# 1.1.1 | Use the following base image "node:17.0-alpine3.14"
FROM node:17.0-alpine3.14 as builder
# 1.1.2 | Working directory inside the containers should be "/app"
WORKDIR /app
# 1.1.3 | Copy "package*.json" file(s) to working directory
COPY package*.json .
# 1.1.4 | Install "npm=7.17.0-r0" package manager, then install dependency packages
RUN apk add --no-cache npm=7.17.0-r0 & npm install 
# 1.1.5 | Copy "app.js" file to working directory
COPY app.js .
# 1.1.6 | Copy the "index.pug" and "favicon.ico" files to the "/app/views" directory
RUN mkdir /app/views

COPY favicon.ico /app/views
COPY index.pug /app/views


# Stage 2: Production
FROM node:17.0-alpine3.14

# Set working directory
WORKDIR /app

# Copy npm configuration and node_modules from builder stage
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules

# Copy application files from builder stage
COPY --from=builder /app/app.js ./
COPY --from=builder /app/views /app/views

# 1.1.7 | The port "80" should be exposed by the container
EXPOSE 80
# 1.1.8 | The container must execute the command "node app.js" in run time
CMD [ "node" , "app.js" ]
