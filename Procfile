release: uv run python manage.py migrate
web: uv run python manage.py collectstatic --noinput && uv run gunicorn TechVidvanLibrary.wsgi:application --bind 0.0.0.0:$PORT