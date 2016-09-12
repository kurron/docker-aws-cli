FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="AWS CLI" org.kurron.ide.version=1.10.63

ENV DEBIAN_FRONTEND noninteractive

# the help switch seems to want this
RUN apt-get update && \
    apt-get install -y groff less && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN pip install --upgrade python-dateutil awscli

# Set the AWS environment variables
ENV AWS_ACCESS_KEY_ID OVERRIDE ME
ENV AWS_SECRET_ACCESS_KEY OVERRIDE_ME
ENV AWS_REGION us-west-2
ENV HOME /home/developer

VOLUME ["/home/developer"]
VOLUME ["/pwd"]

WORKDIR /pwd

ENTRYPOINT ["/usr/local/bin/aws"]
CMD ["--version"]
