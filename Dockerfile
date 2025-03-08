FROM python:3.13-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY smart4-vdsl \
    telekom-datenvolumen \
    telekom-verfuegbarkeit \
    vigor-vdsl \
    zyxel-vdsl \
    ./

ENTRYPOINT ["python3"]
