FROM node:8

WORKDIR /app

RUN useradd -ms /bin/bash aws-es-kibana && \
    chown aws-es-kibana:aws-es-kibana /app && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

COPY aws /root/.aws
COPY package.json /app
RUN npm install
COPY index.js /app

EXPOSE 9200

ENTRYPOINT ["node", "index.js"]
