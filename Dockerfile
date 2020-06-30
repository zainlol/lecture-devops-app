FROM mhart/alpine-node
MAINTAINER "Niaz Faridani-Rad"
RUN apk add git
RUN git clone https://github.com/zainlol/lecture-devops-app.git
WORKDIR lecture-devops-app/app/client
RUN npm install 
RUN npm run build 
RUN mv build /lecture-devops-app/app/server/src/public
RUN npm install /lecture-devops-app/app/server
WORKDIR /lecture-devops-app/app/server
EXPOSE 3000

ENV PORT=3000
ENV MONGODB_URL=mongodb://localhost:27017/todo-app
ENV JWT_SECRET=myjwtsecret

CMD [ "/bin/sh", "-c" , "npm start" ]
