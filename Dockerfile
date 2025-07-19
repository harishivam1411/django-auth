# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.13.3
FROM python:${PYTHON_VERSION}-slim 

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code

RUN pip install --upgrade pip

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

COPY . /code
