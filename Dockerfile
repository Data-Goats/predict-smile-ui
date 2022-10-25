FROM python:3.9
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static

# Copy and install requirements file
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Create App dir and copy app to it
COPY ./ /app
CMD ["gunicorn", "--conf", "app/gunicorn_conf.py", "--bind", "0.0.0.0:80", "app.main:app"]