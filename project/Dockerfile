FROM python:3.9.6-slim-buster

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get -y install netcat gcc \
    && apt-get clean \

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

COPY ./scripts/entrypoint.sh ./scripts
RUN chmod +x /usr/src/app/scripts/entrypoint.sh

ENTRYPOINT ["/usr/src/app/scripts/entrypoint.sh"]
