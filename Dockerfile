FROM ubuntu:latest

COPY nginx.conf /etc/nginx/nginx.conf
COPY .env .env
COPY requirements.txt requirements.txt
COPY /database /database

RUN useradd -ms /bin/bash jupyter
USER jupyter

RUN apt-get update && apt-get install -y python3 \ python3-pip
RUN pip3 install jupyter
RUN pip3 install -r requirements.txt

WORKDIR /home/jupyter
EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--ip=*"]


