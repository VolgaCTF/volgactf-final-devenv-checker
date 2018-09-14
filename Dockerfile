FROM python:3.6-alpine
COPY ./requirements.txt ./entrypoint.sh /other/
RUN apk add --update build-base libffi-dev openssl-dev && pip install -r /other/requirements.txt
ADD ./src /src
WORKDIR /src
ENTRYPOINT ["/other/entrypoint.sh"]
CMD ["python", "-u", "server.py"]
EXPOSE 80
