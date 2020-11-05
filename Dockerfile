FROM yuriylygin/nginx-python:nginx1.19.2-py3.8.6

RUN pip install -U pip

RUN apk update \
    && apk add postgresql-dev lapack libstdc++ openblas libgomp gcc make automake g++ \
    && apk add --virtual .build-deps python3-dev musl-dev subversion gfortran lapack-dev openblas-dev

RUN pip install psycopg2 \
    && pip install pandas \
    && pip install scikit-learn

RUN apk del .build-deps \
    && rm -rf /root/.cache

RUN pip install pipenv 
