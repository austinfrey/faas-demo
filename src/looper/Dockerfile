FROM aafrey/fwatchdog:alpine
RUN apk add --no-cache nodejs && \
    npm install -g coffee-script

ADD package.json .
RUN npm install

ADD . /

ENV fprocess="coffee looper.coffee"
CMD ["fwatchdog"]
