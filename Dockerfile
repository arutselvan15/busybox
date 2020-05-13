FROM debian:9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y ca-certificates curl vim

# enable this when you need certificates
COPY ./ssl/*.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# load test vegeta
ADD http://github.com/tsenart/vegeta/releases/download/v5.9.0/vegeta-v5.9.0-linux-amd64.tar.gz /tmp/vegeta.tar.gz
RUN cd /bin && tar xzvf /tmp/vegeta.tar.gz
RUN chmod +x /bin/vegeta

ADD send-requests.sh /app/
ADD parallel-requests.sh /app/
ADD load-test.sh /app/
ADD README.md /app/

RUN chmod -R +wx /app

CMD ["sh", "-c", "tail -f /dev/null"]