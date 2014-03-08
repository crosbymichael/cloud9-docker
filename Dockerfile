FROM debian:jessie

RUN apt-get update && apt-get install -y nodejs nodejs-legacy npm git-core libxml2-dev curl python build-essential make gcc

RUN git clone git://github.com/ajaxorg/cloud9.git
RUN npm config set ca ""
RUN (cd cloud9/ && npm install)
RUN mkdir /projects
EXPOSE 3131

WORKDIR /projects
ENTRYPOINT ["/cloud9/bin/cloud9.sh"]
CMD ["-l", "0.0.0.0"]
