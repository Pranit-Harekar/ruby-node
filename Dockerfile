FROM ruby:2.3.4

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Create nvm directory
RUN mkdir /usr/local/nvm

# Set environment variables
ENV NODE_VERSION 10.15.0
ENV NVM_DIR /usr/local/nvm
ENV NVM_INSTALL_PATH $NVM_DIR/versions/node/v$NODE_VERSION

# Install nvm https://github.com/nvm-sh/nvm#install--update-script
RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Add node and npm to path
ENV NODE_PATH $NVM_INSTALL_PATH/lib/node_modules
ENV PATH $NVM_INSTALL_PATH/bin:$PATH

# Install yarn
RUN npm install -g yarn

# Verify installation
RUN npm -v 
RUN node -v 
RUN yarn -v 