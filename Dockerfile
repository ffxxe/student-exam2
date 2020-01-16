FROM python:3.8.1-alpine3.11

ENV FLASK_APP=js_example
WORKDIR /opt/flask
COPY . .

RUN . venv/bin/activate
RUN pip install -e .

EXPOSE 5000

ENTRYPOINT ["./flask run --host=0.0.0.0"]
