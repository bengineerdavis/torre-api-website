FROM python:3.7

ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code

COPY requirements.in /code/
# pip-tools is our dependency (package) manager
RUN pip install --upgrade pip pip-tools
RUN pip-compile requirements.in
RUN pip-sync requirements.txt
# RUN pip install -r requirements.txt

COPY . /code/

RUN chown -R $USER:$USER .

EXPOSE 8000