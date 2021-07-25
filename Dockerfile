FROM python:3.8 AS builder
COPY requirements.txt .
RUN pip install --user -r requirements.txt



FROM python:3.8-alpine

WORKDIR /app

EXPOSE 4996

COPY --from=builder /root/.local /root/.local
COPY . /app

ENV PATH=/root/.local:$PATH

CMD ["python3", "app.py"]
