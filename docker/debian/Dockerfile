FROM debian
ARG TARGETARCH
RUN echo TARGETARCH is "$TARGETARCH"
RUN apt-get  -y update
RUN echo "GENERATED at `date`" > /.info
RUN if [ "${TARGETARCH}" = "amd64" ]; then \
apt install -y gcc-aarch64-linux-gnu  mingw-w64/stable ; fi


RUN apt-get install -y \
    build-essential \
    default-jdk-headless \
	procps \
     git \
    nano \
    pkg-config \
    unzip \
    curl 





#COPY root /

#RUN /setup.sh

#ENTRYPOINT /setup.sh


