FROM jekyll/jekyll:latest as builder

WORKDIR /build
COPY . .
RUN mkdir _site
RUN chown -R jekyll /build
RUN jekyll build

FROM nginx:alpine

# copy nginx `default.conf`
COPY nginx/default.conf /etc/nginx/conf.d/
# copy Jekyll generated files
#COPY _site /usr/share/nginx/html/
COPY --from=builder /build/_site /usr/share/nginx/html/

# replace $PORT placeholder with HEROKU given port in default.conf and run nginx service
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
