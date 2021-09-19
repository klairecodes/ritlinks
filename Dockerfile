# syntax = docker/dockerfile:1.3
FROM python:latest

WORKDIR /code

ARG ritlinks_db_pw
ARG ritlinks_db_host
ARG secret_key

ENV PORT 8000
ENV PYTHONUNBUFFERED = 1
ENV DJANGO_DEBUG = False

# Database environment
ENV RITLINKS_DB=ritlinks
ENV RITLINKS_DB_USER=ritlinks
ENV RITLINKS_DB_PW=$ritlinks_db_pw
ENV RITLINKS_DB_HOST=$ritlinks_db_host
ENV RITLINKS_DB_PORT=5432
ENV SECRET_KEY=$secret_key

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

RUN ["python", "manage.py", "makemigrations"]
RUN ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
