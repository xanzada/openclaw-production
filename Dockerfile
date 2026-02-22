FROM node:22

# Жүйеге қажетті кітапханаларды орнату (Discord және басқа модульдер қате бермеуі үшін)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# OpenClaw-ды бір-ақ рет "пісіріп" (bake) аламыз
RUN npm install -g openclaw

# Деректер сақталатын папканы дайындау
RUN mkdir -p /root/.openclaw

EXPOSE 18789

# Контейнер қосылған кезде бірден орындалатын бұйрық
CMD ["openclaw", "gateway", "--bind", "lan", "--port", "18789", "--allow-unconfigured"]
