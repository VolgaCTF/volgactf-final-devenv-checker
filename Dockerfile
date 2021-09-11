FROM volgactf/volgactf-final-python-checker:3.1.0
ADD src VERSION /dist/checker/
WORKDIR /dist
RUN pip install --requirement checker/requirements.txt
CMD ["python", "-u", "server.py"]
EXPOSE 80
