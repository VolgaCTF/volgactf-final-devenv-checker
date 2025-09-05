# FROM volgactf/volgactf-final-python-checker:5.0.0
FROM volgactf/volgactf-final-python-checker:latest
LABEL maintainer="VolgaCTF"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="volgactf-final-devenv-checker"
LABEL org.label-schema.description="VolgaCTF Final devenv checker – provides a Dockerfile for a sample service checker"
LABEL org.label-schema.url="https://volgactf.ru/en"
LABEL org.label-schema.vcs-url="https://github.com/VolgaCTF/volgactf-final-devenv-checker"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.version=$BUILD_VERSION

ADD src VERSION /dist/checker/
WORKDIR /dist
RUN pip install --requirement checker/requirements.txt
CMD ["python", "-u", "server.py"]
EXPOSE 80
