FROM ubuntu:18.04 
MAINTAINER Sergey Zaika
COPY . .
RUN apt-get update && apt-get install -y python3-pip && pip3 install flask sqlalchemy
EXPOSE 4996
CMD [ "python3", "./app.py" ]
 

