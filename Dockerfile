FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y iputils-ping fortune-mod cowsay netcat-openbsd curl wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh .

RUN useradd -m wisecow && \
    chown -R wisecow:wisecow /app && \
    chmod 755 /app

USER wisecow

ENV PATH="/usr/games:${PATH}"

EXPOSE 4499

CMD ["bash", "wisecow.sh"]