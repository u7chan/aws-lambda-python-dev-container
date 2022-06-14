FROM python:3.9-slim

ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

RUN apt update && \
    apt-get -y upgrade && \
    apt-get -y install \
    bash \
    git \
    curl \ 
    locales \ 
    locales-all && \
    pip install --upgrade pip && \
    pip install isort && \
    pip install pylint && \
    pip install autopep8 