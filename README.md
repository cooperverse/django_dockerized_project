📦 Django Dockerized Project
🚀 Overview

This project is a Dockerized Django application designed to run consistently across development and production environments.

It uses:

Python 3.13 (slim-bookworm)

Django

Docker & Docker Compose

uv for dependency management

The application is fully containerized to eliminate environment drift and make deployment predictable.

🧰 Tech Stack

Python 3.13

Django

Docker & Docker Compose

uv

PostgreSQL (if applicable)

🐳 Why Docker?

Containerization ensures:

Consistent runtime environment across machines

No dependency conflicts

Simple onboarding for developers

Easy deployment workflow

📁 Project Structure
.
├── Dockerfile
├── docker-compose.yml
└── src/
    ├── entrypoint.sh
    ├── manage.py
    ├── requirements.txt
    └── project/

Docker configuration files live at the project root.

Django code lives inside the src/ folder.

entrypoint.sh runs migrations and starts the server inside the container.

🔑 Environment Setup

This project requires a .env file to run.

Copy the example file:

cp src/.env.example src/.env

Edit the .env file and fill in your values:

DEBUG=True
SECRET_KEY=your-secret-key
DB_NAME=django_db
DB_USER=postgres
DB_PASSWORD=secret
DB_HOST=db
DB_PORT=5432

Docker Compose will automatically read this file when starting the containers.

⚠️ Do not push your real .env file to GitHub.

⚙️ How to Run the Project
1️⃣ Clone the repository
git clone https://github.com/your-username/your-repo.git
cd your-repo
2️⃣ Build and start containers
docker compose up --build
3️⃣ Access the application

Open your browser at:

http://localhost:8000
🛠 What Happens on Startup?

When the container starts:

Database migrations are applied automatically

Django development server starts on 0.0.0.0:8000

All logs appear in the console.

🔄 Useful Docker Commands

Stop all containers:

docker compose down

Run migrations manually:

docker compose exec web python manage.py migrate

Access the container shell:

docker compose exec web bash
📌 Future Improvements

Replace Django runserver with Gunicorn/Uvicorn for production

Multi-stage Docker build to reduce image size

Run containers as a non-root user

Add healthchecks for each service

Separate docker-compose.dev.yml and docker-compose.prod.yml

📄 License

This project is for educational and development purposes.
