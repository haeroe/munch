#!/bin/sh
echo "Entry"
ls -al .
python src/manage.py runserver munch-backend:8000
