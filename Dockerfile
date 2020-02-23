FROM python:3.7

# install smtp
RUN apt-get update && apt-get install msmtp -y
RUN rm -rf /var/lib/apt/lists/*

ARG APP_DIR="/app"

WORKDIR $APP_DIR

COPY app/requirements.txt .

RUN pip install -r requirements.txt

COPY app .

CMD python main.py
