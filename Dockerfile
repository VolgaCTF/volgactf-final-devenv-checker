FROM python:3.6-alpine
ADD . /code
WORKDIR /code
RUN apk add --update build-base libffi-dev openssl-dev && pip install -r requirements.txt
CMD ["python", "-u", "server.py"]
EXPOSE 80
