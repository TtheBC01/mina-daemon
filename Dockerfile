FROM minaprotocol/mina-daemon:1.3.0-9b0369c-bullseye-mainnet

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt update -y && \
    apt install -y vim \
                   git \
                   tmux \
                   htop \
                   nodejs \
                   mina-generate-keypair=1.3.0-9b0369c

WORKDIR /root

RUN npm install -g zkapp-cli

RUN mkdir /root/keys
RUN chmod 700 /root/keys

COPY .mina-env .mina-env
				
ENTRYPOINT ["bash"]