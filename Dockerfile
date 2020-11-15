# Build site
FROM jekyll/jekyll:3.8

COPY . .

RUN bundle install
RUN bundle exec jekyll build

# Host site


#JEKYLL_VERSION=3.8 && docker run --rm   --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle"   -p 4000:4000 -it jekyll/jekyll:$JEKYLL_VERSION bundle exec jekyll build