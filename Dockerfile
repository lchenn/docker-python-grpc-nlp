FROM python:3.6.8-slim

COPY requirements.txt /tmp/

RUN cd /tmp/ \
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r requirements.txt \
    && rm -rf /tmp/requirements.txt
