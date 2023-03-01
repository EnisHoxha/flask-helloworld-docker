FROM python:3.12.0a5-slim-bullseye
RUN apt-get update && apt-get install -y \
    python3-pip
RUN useradd python
WORKDIR /app
RUN chown python /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 5000
USER python
CMD [ "python3","application.py" ]