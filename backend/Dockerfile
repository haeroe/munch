FROM python:3.9.21-alpine
WORKDIR /live

#COPY src src
COPY requirements.txt requirements.txt

#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
RUN pip install -r requirements.txt

EXPOSE 8000
ENTRYPOINT ["src/entry.sh"]
