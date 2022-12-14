FROM python:3.8.3-alpine

RUN pip install --upgrade pip

RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser

COPY --chown=myuser:myuser requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

#ENV PATH="/home/myuser/.local/bin:/home/myuser/.local/bin"

COPY --chown=myuser:myuser . .

CMD ["python", "runserver", "0.0.0.0:8000"]
