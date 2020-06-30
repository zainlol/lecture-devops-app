FROM mhart/alpine-node
MAINTAINER "Niaz Faridani-Rad"
RUN apk add git
RUN git clone https://github.com/zainlol/lecture-devops-app.git
RUN cd lecture-devops-app/app/client
RUN npm install
RUN npm run build
RUN cp -R src/build .server/src/public
RUN cd .server
RUN npm install
CMD ["npm", "start"]
