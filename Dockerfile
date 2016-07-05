FROM python:2.7
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
COPY /code/project/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY /code/project /project
RUN chown -R uwsgi /project
COPY uwsgi.sh /uwsgi.sh
RUN chmod +x /uwsgi.sh
