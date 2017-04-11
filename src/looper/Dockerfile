FROM aafrey/fwatchdog:alpine
RUN apk add --no-cache nodejs && \
    npm install -g coffee-script

ADD . /
RUN npm install

ENV fprocess="coffee looper.coffee"
CMD ["fwatchdog"]
