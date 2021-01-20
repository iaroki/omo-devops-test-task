FROM python:3.9.1
WORKDIR /app
COPY requirements.txt .
COPY . . 
RUN pip3 install -r requirements.txt
EXPOSE 4996
CMD [ "python3", "./app.py" ]