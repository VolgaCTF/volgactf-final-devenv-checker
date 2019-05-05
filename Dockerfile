FROM volgactf/volgactf-final-python-checker:1.0.0
ADD src VERSION /dist/
WORKDIR /dist
RUN pip install -r requirements.txt
CMD ["python", "-u", "server.py"]
EXPOSE 80
