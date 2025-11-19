FROM python:3.10-slim AS python-base
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1 \
	PYTHONDONTWRITEBYTECODE=1 \
	\
	PIP_NO_CACHE_DIR=off \
	PIP_DISABLE_PIP_VERSION_CHECK=on \
	PIP_DEFAULT_TIMEOUT=100 \
	\
	POETRY_VERSION=2.2.1 \
	POETRY_HOME="/opt/poetry" \
	POETRY_VIRTUALENVS_IN_PROJECT=true \
	POETRY_NO_INTERACTION=1 \
	PYSETUP_PATH="/opt/pysetup" \
	VENV_PATH="/opt/pysetup/.venv"

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"


RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 - 

RUN apt-get update && apt-get -y install libpq-dev gcc

WORKDIR $PYSETUP_PATH

COPY pyproject.toml poetry.lock ./

RUN poetry install --only main 

WORKDIR /app

COPY . /app/

EXPOSE 8000

COPY wait-for-it.sh /wait-for-it.sh

RUN chmod +x /wait-for-it.sh

CMD ["./wait-for-it.sh", "db:5432", "--", "python", "manage.py", "runserver", "0.0.0.0:8000"]
