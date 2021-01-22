FROM python:3.9.1
WORKDIR /app
COPY . . 
RUN pip3 install -r requirements.txt
EXPOSE 4996
ENTRYPOINT [ "python3", "./app.py" ]