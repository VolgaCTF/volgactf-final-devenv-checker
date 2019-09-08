FROM volgactf/volgactf-final-python-checker:3.0.0
ADD src VERSION /dist/checker/
WORKDIR /dist
RUN pip install -r checker/requirements.txt
CMD ["python", "-u", "server.py"]
EXPOSE 80
