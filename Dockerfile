FROM python:3.9

ARG APP_DIR="/app"

WORKDIR $APP_DIR

COPY app/requirements.txt .

RUN pip install -r requirements.txt

COPY app .

CMD ["python app.py"]
