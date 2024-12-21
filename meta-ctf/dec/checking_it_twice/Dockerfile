FROM node:lts

WORKDIR /checking_it_twice

RUN apt update
RUN apt install python3 -y

RUN useradd appuser && chown -R appuser /checking_it_twice

USER appuser

COPY package*.json ./

USER root
RUN npm install

USER appuser
COPY public public/
COPY views views/
COPY *.js ./
COPY hook.sh .
COPY flag.txt flag.txt

EXPOSE 8080

CMD ["./hook.sh"]