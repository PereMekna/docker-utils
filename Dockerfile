# This image will be based on the official nodejs docker image
FROM node:latest
 
# Set in what directory commands will run
WORKDIR /home/app
 
# Put all our code inside that directory that lives in the container
RUN git clone https://github.com/PereMekna/pause-client.git

WORKDIR /home/app/client-coffee

# Install dependencies
RUN \
    npm install -g bower && \
    npm install && \
    bower install --config.interactive=false --allow-root && \
    npm install -g grunt
 
# Tell Docker we are going to use this port
EXPOSE 9000
 
# The command to run our app when the container is run
CMD ["grunt", "serve"]