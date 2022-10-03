# FROM python:3.8.13
# WORKDIR '/app'
# COPY . /app
# RUN pip install rasa==3.0.13
# RUN rasa train
# EXPOSE 5005
# CMD ["python","-m","rasa","run","--enable-api"]



FROM rasa/rasa:latest
WORKDIR '/app'
COPY . /app
USER root
# WORKDIR /app
# COPY . /app
COPY ./data /app/data
RUN  rasa train
VOLUME /app
VOLUME /app/data
VOLUME /app/models
CMD ["run","-m","/app/models","--enable-api","--cors","*","--debug" ,"--endpoints", "endpoints.yml", "--log-file", "out.log", "--debug"]
#CMD ["run","-m","/app/models","--enable-api","--cors","*","--debug" ,"--endpoints", "endpoints.yml", "--log-file", "out.log", "--debug","--jwt-secret","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJuYW1lIjoiZ292aW5kIiwicm9sZSI6InVzZXIifX0.htw9yrie4r97UXIE-AOjASM7MYf0VNx_y322RFH1AAQ"]

# FROM ubuntu:18.04
# ENTRYPOINT []
# RUN apt-get update && apt-get install -y python3 python3-pip && python3 -m pip install --no-cache --upgrade pip && pip3 install --no-cache rasa==2.8.26
# ADD . /app/
# RUN chmod +x /app/service.sh
# CMD /app/service.sh