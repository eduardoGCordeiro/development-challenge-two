FROM anapsix/alpine-java

RUN apk add --update nodejs npm

WORKDIR /usr/src/manager-patient/

COPY /server/package.json /server/package-lock.json server/
COPY /client/package.json /client/package-lock.json client/

RUN cd client && npm install && cd ..
RUN cd server && npm install && cd ..

COPY . .

CMD  cd server && npm run dev

EXPOSE 3000


