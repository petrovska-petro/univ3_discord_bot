FROM python:3.8

ADD src/discord_bot.py /
ARG ALCHEMYAPI_TOKEN
ARG BOT_TOKEN
ARG GUILD_ID

ENV ALCHEMYAPI_TOKEN=$ALCHEMYAPI_TOKEN
ENV BOT_TOKEN=$BOT_TOKEN
ENV GUILD_ID=$GUILD_ID

RUN apt-get remove libexpat1 libexpat1-dev -y
RUN apt-get remove libsasl2-2 libsasl2-modules-db -y
RUN apt-get remove linux-libc-dev -y
RUN apt-get remove libssl-dev -y
RUN apt-get remove libtiff5 libtiffxx5 -y
RUN apt-get update -y
RUN apt-get install libc-bin>=2.31-13+deb11u3 libmariadb3>=1:10.5.15-0+deb11u1 libxml2>=2.9.10+dfsg-6.7+deb11u1 mariadb-common>=1:10.5.15-0+deb11u1 -y
RUN apt-get install libssl-dev>=1.1.1k-1+deb11u2 libssl1.1>=1.1.1k-1+deb11u2 openssl>=1.1.1k-1+deb11u2 -y
RUN apt-get install libexpat1>=2.2.10-2+deb11u1 -y
RUN apt-get install libsasl2-2>=2.1.27+dfsg-2.1+deb11u1 -y
RUN apt-get install linux-libc-dev>=5.10.92-2 libc6-dev -y
RUN apt-get install libtiff5>=4.2.0-1+deb11u1 -y
RUN apt-get install zlib1g>=1:1.2.11.dfsg-2+deb11u1 -y
RUN apt-get install git -y

RUN pip install discord discord.py python-dotenv web3