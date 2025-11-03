#!/bin/bash

python3.9 -m pip install -r requirements.txt

# Create directories
mkdir -p staticfiles_build/static/media

# Copy media files
if [ -d "static/media" ]; then
    cp -r static/media/* staticfiles_build/static/media/ || true
fi



# Collect static files
python3.9 manage.py collectstatic --noinput --clear

# Make migrations (optional - comment out if you have existing DB)
python3.9 manage.py makemigrations --noinput || true
python3.9 manage.py migrate --noinput || true