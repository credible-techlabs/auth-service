FROM python:3.12-slim
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy only the necessary files for dependency installation
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry install

# Copy the rest of the application code
COPY . .

CMD ["poetry", "run", "uvicorn", "auth_service.app:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]