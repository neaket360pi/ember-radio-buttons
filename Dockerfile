FROM node:0.10.38
RUN npm install -g bower phantomjs ember-cli

# install npm packages
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src

# install bower packages
ADD bower.json /tmp/bower.json
ADD .bowerrc /tmp/.bowerrc
RUN cd /tmp && bower install --allow-root
RUN mkdir -p /src && cp -a /tmp/bower_components /src

# copy src code
ADD . /src
WORKDIR /src


