FROM quay.io/eypzgod/izumi:latest
RUN git clone https://github.com/Akshay-Eypz/izumi-bot /root/rndr/
WORKDIR /root/rndr/
RUN yarn install --network-concurrency 1
RUN yarn global add pm2@6.0.5
CMD ["npm", "start"]
