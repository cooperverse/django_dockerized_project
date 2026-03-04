FROM python:3.13-slim-bookworm

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

RUN apt-get update && apt-get install -y curl

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY src/requirements.txt .
RUN uv pip install -r requirements.txt --system

COPY src/ .
EXPOSE 8000
CMD ["./entrypoint.sh"]
