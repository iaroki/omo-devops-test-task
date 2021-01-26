#Installing python
FROM python:3

WORKDIR /app
COPY requirements.txt .
COPY . .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install flask_sqlalchemy
#RUN
CMD ["python","./app.py", "./database_setup.py"]
