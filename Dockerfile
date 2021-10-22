# "as" is for defining phases for Multi-Step
# builds
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# for production system volume is not used
COPY . .
# CMD ["npm", "run", "build"]
RUN npm run build

# /app/build
FROM nginx

# PORT FORWARDING PORT 80
# expose this port for incoming traffic
# seems not necessary anymore, worked
# without EXPOSE declared
EXPOSE 80
# --from=phase telling to copy content from
# other phase defined with "as"
# folder to copy as 2nd argument
# destination as 3rd argument
# /usr/share/nginx/html is from hub.docker.com
# nginx specific for static content
# automatically served when nginx starts-up
COPY --from=builder /app/build /usr/share/nginx/html
# nginx image already have CMD to "start nginx"
# automatically so it doesn't have to be
# specified