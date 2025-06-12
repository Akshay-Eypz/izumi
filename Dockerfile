FROM node:lts-buster

# Install necessary system packages
RUN apt-get update && \
  apt-get install -y ffmpeg git imagemagick webp && \
  npm i -g pm2 && \
  rm -rf /var/lib/apt/lists/*

# Clone your repo to root/rndr
RUN git clone https://github.com/Akshay-Eypz/izumi-bot /root/rndr

# Set working directory
WORKDIR /root/rndr

# Install dependencies using npm instead of yarn
RUN npm install --legacy-peer-deps

# Start using PM2
CMD ["pm2-runtime", "ecosystem.config.js"]
