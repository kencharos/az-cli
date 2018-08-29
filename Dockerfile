FROM debian:stretch
MAINTAINER kentaro.maeda

RUN apt-get update && apt-get install -y curl wget dirmngr &&\
 echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ stretch main" > /etc/apt/sources.list.d/azure-cli.list &&\
 apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 &&\
 wget https://packages.microsoft.com/keys/microsoft.asc &&\
 apt-key add microsoft.asc &&\
 apt-get install -y apt-transport-https &&\
 apt-get update && \
 apt-get install -y azure-cli

WORKDIR /app
ADD loginThen.sh /app/
RUN chmod +x /app/loginThen.sh

ENV APP_ID ""
ENV PASSWORD ""
ENV TENANT ""

ENTRYPOINT ["/app/loginThen.sh"]
