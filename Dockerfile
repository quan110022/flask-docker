FROM python:3.6
RUN pip install poetry
RUN docker service update --image python:3.8 python
WORKDIR /app
COPY ./ /app
RUN poetry install
ENTRYPOINT ["poetry","run"]
CMD ["gunicorn","-b","0.0.0.0:5000", "server:app"]
