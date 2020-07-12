FROM openjdk:8-slim
COPY --from=python:3.7 / /
RUN pip install pipenv
RUN set -ex && mkdir /app
COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock
RUN set -ex && pipenv install --deploy --system

WORKDIR /app
COPY . /app
CMD python3 main.py
