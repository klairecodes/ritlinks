FROM python:latest

WORKDIR /code

ENV PORT 8000
ENV PYTHONUNBUFFERED=1
ENV DJANGO_DEBUG = False

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

RUN "python" "manage.py" "makemigrations"
RUN "python" "manage.py" "migrate"
