FROM python:3
MAINTAINER Eric Lee <ericstone.dev@gmail.com>

RUN apt-get update && \
	apt-get install --assume-yes --no-install-recommends \
		python-dev \
		python-pip \
		libxml2-dev \
		libxslt1-dev \
		zlib1g-dev \
		libffi-dev \
		libssl-dev && \
	apt-get clean && \
	rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --upgrade pip && \
	pip install --upgrade \
		setuptools \
		wheel

ADD requirements.txt /tmp/requirements.txt
RUN	pip install --upgrade --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app

CMD ["scrapy", "shell", "--nolog"]