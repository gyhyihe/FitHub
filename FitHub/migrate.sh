#!/bin/bash

python3 manage.py makemigrations $1
python3 manage.py migrate
python3 manage.py runserver
