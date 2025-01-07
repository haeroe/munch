FROM python:3.9.21-alpine
WORKDIR /live

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD ["robot", "robot"]
