FROM alpine

# install ruby dependencies
# nodejs
RUN apk install nodejs

# ruby
RUN apk install ruby 

# rethinkdb
RUN apk install rethinkdb