```
Dockerfile
FROM python:3.8-slim-buster

WORKDIR /app

COPY insecure_code.py .

RUN pip install bandit

RUN bandit -r /app --exclude B404

CMD ["python", "insecure_code.py"]

# Build the image with the tag my-insecure-app

```



```
FROM python:3.8-slim-buster

WORKDIR /app

COPY secure_code.py .

RUN pip install bandit

RUN bandit -r /app

CMD ["python", "secure_code.py"]

# Build the image with the tag my-secure-app
```