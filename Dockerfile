FROM node:22

RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw

RUN mkdir -p /root/.openclaw

EXPOSE 18789

CMD sh -c "openclaw config set gateway.controlUi.allowInsecureAuth true && openclaw gateway --bind lan --port 18789 --allow-unconfigured"
