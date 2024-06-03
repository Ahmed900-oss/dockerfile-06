.1 Write a Dockerfile for all applications by following the instructions (from 1.1.1 to 1.1.8) presented below. The created sampler of Dockerfile should be the same for all applications.

1.1.1 Docker images must be based on this base image node:17.0-alpine3.14

1.1.2 The working directory inside the containers should be the /app directory

1.1.3 Copy the package*.json files to the working directory /app before installation of the npm package manager

1.1.4 Install the npm package manager via apk (APK stands for Alpine Linux package keeper/manager). 
The required version of the npm is npm=7.17.0-r0. See how to install packages in Alpine. After the apk instruction 
install dependency packages with the nmp install command

1.1.5 Copy the app.js file to the working directory

1.1.6 Copy the index.pug and favicon.ico files to the /app/views/ directory

1.1.7 All containers must expose the port 80

1.1.8 All containers should execute the following command: node app.js in run time

1.2 Build Docker images for each web app, with following namings:

trafficlight/red:v1.0
