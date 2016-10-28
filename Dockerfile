FROM alpine:latest

ENV TERRAFORM_VERSION 0.7.7

RUN apk add --update wget ca-certificates unzip python py-pip openssl && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi && \
    pip install ansible==2.1 && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* /terraform.zip

ENTRYPOINT ["tail"]