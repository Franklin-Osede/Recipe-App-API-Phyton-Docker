FROM python:3.9-alpine3.13
LABEL maintainer="franklin-osede.com"

ENV PYTHONUNBUFFERED 1

COPY ./requierements.txt /tmp/requierements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requierements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user