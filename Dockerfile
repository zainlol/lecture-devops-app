FROM mhart/alpine-node
MAINTAINER "Niaz Faridani-Rad"
RUN apk add git
RUN git clone https://github.com/zainlol/lecture-devops-app.git
RUN npm install lecture-devops-app/app/client
RUN npm run build lecture-devops-app/app/client
RUN cp -R lecture-devops-app/app/client/src/build lecture-devops-app/app/server/src/public
RUN npm install lecture-devops-app/app/server/
CMD ["npm", "start"]
