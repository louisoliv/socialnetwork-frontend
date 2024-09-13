FROM node:latest

WORKDIR /socialnetwork-frontend

COPY . .

RUN npm install

EXPOSE 3000

CMD ["tail", "-f", "/dev/null"]
