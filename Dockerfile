FROM nginx:alpine
RUN apk add --update npm
RUN apk add hugo
RUN apk add rsync
RUN npm install @stackbit/stackbit-pull

COPY . .
ARG STACKBIT_API_KEY
RUN npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e20c5e92414200019b1f29c
RUN hugo
RUN rsync -rv public/ /usr/share/nginx/html/
EXPOSE 80/tcp
