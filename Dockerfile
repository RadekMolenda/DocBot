FROM qrczeno/ruby2.3-doc
MAINTAINER Radek Molenda "radek.molenda@gmail.com"


COPY . "/usr/src/app"

WORKDIR "/usr/src/app"

RUN bundle install
RUN gem rdoc --all --ri --no-rdoc
ARG token

ENV SLACK_API_TOKEN $token

CMD [ "ruby" "lib/messenger.rb" ]