FROM python:3.6
MAINTAINER Eric Lee <eric.lee@cicdata.com>

# to skip buffering
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir /app
WORKDIR /app