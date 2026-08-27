FROM python:3.12-slim

WORKDIR /home/myapp

RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --upgrade \
        "setuptools>=78.1.1" \
        "msgpack>=1.2.1" \
    && python -m pip install --no-cache-dir -r requirements.txt \
    && python -m pip uninstall -y pip setuptools msgpack \
    && rm -rf \
        /usr/local/lib/python3.12/ensurepip \
        /usr/local/lib/python3.12/site-packages/pip \
        /usr/local/lib/python3.12/site-packages/pip-*.dist-info \
        /usr/local/lib/python3.12/site-packages/setuptools \
        /usr/local/lib/python3.12/site-packages/setuptools-*.dist-info \
        /root/.cache

COPY . .

EXPOSE 5050

CMD ["python", "sample_app.py"]