FROM python:3.6
RUN pip install poetry
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install python3.8
WORKDIR /app
COPY ./ /app
RUN poetry install
ENTRYPOINT ["poetry","run"]
CMD ["gunicorn","-b","0.0.0.0:5000", "server:app"]
