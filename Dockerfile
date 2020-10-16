FROM python:latest

WORKDIR /code

# Port inside container
ENV PORT 80
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

CMD "python" "manage.py" "makemigrations"
CMD "python" "manage.py" "migrate"
CMD "python" "manage.py" "runserver" "0.0.0.0:8000"
