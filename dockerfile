FROM python:3.8

WORKDIR /app

COPY ["app.py", "database_setup.py", "requirements.txt", "./"]
COPY templates ./templates
RUN pip install -r requirements.txt

EXPOSE 4996

CMD [ "python3", "app.py" ]