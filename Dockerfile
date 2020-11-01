FROM yuriylygin/nginx-python:nginx1.19.2-py3.8.6

RUN pip install -U pip

RUN apk update \
    && apk add postgresql-dev lapack libstdc++ openblas libgomp \
    && apk add --virtual .build-deps gcc python3-dev musl-dev make automake g++ subversion gfortran lapack-dev openblas-dev

RUN pip install psycopg2 \
    && pip install pandas \
    && pip install scikit-learn

RUN apk del .build-deps \
    && rm -rf /root/.cache

RUN pip install pipenv 