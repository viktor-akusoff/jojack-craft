FROM ubuntu:22.04
MAINTAINER Viktor Akusov <viktor@akusov.xyz>
ARG rcon_password=12345
ARG motd=JOJACK-CRAFT
ARG level_seed=5910974657933364
WORKDIR /root/
COPY get_server_and_plugins.sh ./
COPY launch.sh ./
COPY server.properties ./
RUN sed -i "s/RCON-PASSWORD/$rcon_password/g" ./server.properties && \
    sed -i "s/LEVEL-SEED/$level_seed/g" ./server.properties && \
    sed -i "s/MOTD/$motd/g" ./server.properties && \
    cat ./server.properties && \
    apt update && apt install -y software-properties-common ca-certificates apt-transport-https curl wget && \
    curl https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository 'deb https://apt.corretto.aws stable main' && \
    apt update && \
    apt install -y jq java-17-amazon-corretto-jdk && \
    bash ./get_server_and_plugins.sh
COPY worlds.yml ./plugins/Multiverse-Core/
ENTRYPOINT ["bash", "./launch.sh"]
EXPOSE 25565
EXPOSE 25575
EXPOSE 24454
