FROM python:2.7

RUN mkdir -p /opt/temp
WORKDIR /opt/app/temp

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf /opt/app/temp
