FROM python:3.7

ARG APP_DIR="/app"

WORKDIR $APP_DIR

COPY app/requirements.txt .

RUN pip install -r requirements.txt

COPY app .

ENTRYPOINT ["app.py"]

CMD ["python"]
