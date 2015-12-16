FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="AWS CLI" org.kurron.ide.version=1.9.3

ENV DEBIAN_FRONTEND noninteractive

# Create a user and group that matches what is in most Vagrant boxes
RUN groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer /home/developer

# Set the environment to use the new user account
ENV HOME /home/developer

# the user of this image is expected to mount his actual home directory to this one
VOLUME ["/home/developer"]

# the help switch seems to want this
RUN apt-get update && \
    apt-get install -y groff less && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN pip install --upgrade pip python-dateutil awscli

# Set the AWS environment variables
ENV AWS_ACCESS_KEY_ID OVERRIDE ME 
ENV AWS_SECRET_ACCESS_KEY OVERRIDE_ME
ENV AWS_REGION us-west-2

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/usr/local/bin/aws"]
CMD ["--version"]
