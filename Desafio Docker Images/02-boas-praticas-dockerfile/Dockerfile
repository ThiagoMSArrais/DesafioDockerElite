FROM python:alpine3.21 AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

FROM python:alpine3.21
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 8000
RUN pip install --no-cache-dir fastapi uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
