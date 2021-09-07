#!/bin/bash
# Generates a random secret key for Django to stdout.
#
# Tip: To directy set the environment variable, do:
# export RITLINKS_DB_PW=$(./generate_secret_key.sh)

python manage.py shell -c 'from django.core.management import utils; print(utils.get_random_secret_key())'

