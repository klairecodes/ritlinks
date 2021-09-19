#!/bin/bash

# Is this redundant? I guess we'll find out
export SECRET_KEY=$(SECRET_KEY)
export RITLINKS_DB=$(RITLINKS_DB)
export RITLINKS_DB_USER=$(RITLINKS_DB_USER)
export RITLINKS_DB_PW=$(RITLINKS_DB_PW)
export RITLINKS_DB_HOST=$(RITLINKS_DB_HOST)
export RITLINKS_DB_PORT=$(RITLINKS_DB_PORT)

python3 manage.py runserver 0.0.0.0:8000
