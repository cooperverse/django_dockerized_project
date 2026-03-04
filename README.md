# Django Dockerized Project
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/cooperverse/django_dockerized_project)

This repository contains a simple Django project that is fully containerized using Docker and Docker Compose. It is set up to run a Django application with a PostgreSQL database, providing a consistent and isolated development environment.

## 🚀 Features

-   **Containerized Environment**: Uses Docker to ensure consistency across different machines.
-   **Service Orchestration**: Manages the Django application and PostgreSQL database with Docker Compose.
-   **Fast Dependency Management**: Leverages `uv` for rapid Python package installation.
-   **Automated Migrations**: The entrypoint script automatically applies database migrations on startup.
-   **Persistent Data**: A Docker volume is used to persist PostgreSQL data across container restarts.

## 🧰 Tech Stack

-   **Backend**: Django
-   **Database**: PostgreSQL 17
-   **Containerization**: Docker, Docker Compose
-   **Language**: Python 3.13
-   **Package Manager**: `uv`

## 📂 Project Structure

```
.
├── Dockerfile          # Defines the image for the Django web application.
├── docker-compose.yml  # Defines and orchestrates the web and db services.
└── src/
    ├── requirements.txt# Lists Python dependencies.
    ├── entrypoint.sh   # Startup script for database migrations and starting the server.
    ├── manage.py       # Django's command-line utility.
    ├── core/           # A Django app with an 'Actor' model.
    └── django_docker_practice/ # Django project settings and configuration.
```

## ⚙️ Getting Started

Follow these steps to get the project running on your local machine.

### Prerequisites

-   [Docker](https://docs.docker.com/get-docker/)
-   [Docker Compose](https://docs.docker.com/compose/install/)

### 1. Clone the Repository

```bash
git clone https://github.com/cooperverse/django_dockerized_project.git
cd django_dockerized_project
```

### 2. Create an Environment File

The application requires a `.env` file in the project's root directory for configuration. Create a file named `.env` and add the following content.

```env
# .env

# Django Settings
# WARNING: Change this in a real production environment
SECRET_KEY=django-insecure-!r&-1-n+u@st(@ut2aq4u1k=9=$)!nbw#dk0i&$b71b(rg-@*5
DEBUG=True

# PostgreSQL Credentials (used by docker-compose.yml to initialize the db)
POSTGRES_DB=django_db
POSTGRES_USER=postgres
POSTGRES_PASSWORD=secret

# Django Database Connection (used by settings.py to connect to the db service)
DB_HOST=db
DB_PORT=5432
```

**Note:** The `DB_HOST` is set to `db`, which is the service name of the PostgreSQL container defined in `docker-compose.yml`.

### 3. Build and Run the Containers

Use Docker Compose to build the images and start the services defined in `docker-compose.yml`.

```bash
docker compose up --build
```

The `web` service will wait for the `db` service to be healthy before starting. Once the database is ready, the `entrypoint.sh` script will run database migrations and start the Django development server.

### 4. Access the Application

The Django application will be available at [http://localhost:8000](http://localhost:8000). You can access the Django admin panel at [http://localhost:8000/admin/](http://localhost:8000/admin/).

To create a superuser for the admin panel, run the following command in a separate terminal:

```bash
docker compose exec web python manage.py createsuperuser
```

## 🛠️ Useful Docker Compose Commands

-   **Stop and remove containers, networks, and volumes:**
    ```bash
    docker compose down
    ```

-   **Run a Django management command (e.g., `makemigrations`):**
    ```bash
    docker compose exec web python manage.py makemigrations
    ```

-   **Access the shell inside the `web` container:**
    ```bash
    docker compose exec web bash
    ```

-   **View logs for a specific service (e.g., `web`):**
    ```bash
    docker compose logs -f web
