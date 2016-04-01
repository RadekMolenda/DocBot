FROM qrczeno/ruby2.3-doc
MAINTAINER Radek Molenda "radek.molenda@gmail.com"

WORKDIR "/usr/src/app"

CMD [ "ruby" "bin/doc_bot.rb" ]