FROM python:3.11-bullseye

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install --no-install-recommends \
    build-essential \
    sudo \
    curl \
    apt-utils \
    git \
    procps \
    gcc \
    odbc-postgresql \
    unixodbc-dev 2>&1
RUN apt autoremove -y 
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

RUN useradd -m -d /home/datasense -p datasense -s /bin/bash datasense
RUN usermod -aG sudo datasense
USER datasense
RUN echo "export PATH=/home/datasense/.local/bin:$PATH" >> /home/datasense/.bashrc

WORKDIR /workspaces

EXPOSE 8080

CMD ["/bin/bash"]