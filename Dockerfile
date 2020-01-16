FROM python:3.8.1-alpine3.11

ENV FLASK_APP=js_example
WORKDIR /opt/flask
COPY . .

RUN python3 -m venv venv && \
    pip install --no-cache-dir -e . && \
    chmod 755 ./flask.sh

EXPOSE 5000

ENTRYPOINT ["./flask.sh"]
