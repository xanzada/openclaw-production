FROM node:22

# Жүйелік пакеттер (native модульдер үшін)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# OpenClaw-ды бір рет орнату
RUN npm install -g openclaw

# OpenClaw деректері үшін папка
RUN mkdir -p /root/.openclaw

EXPOSE 18789

CMD sh -c "openclaw config set gateway.controlUi.allowInsecureAuth true && openclaw config set gateway.trustedProxies '10.0.0.0/8,172.16.0.0/12,192.168.0.0/16' && openclaw gateway --bind lan --port 18789 --allow-unconfigured"
