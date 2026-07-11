# Start from a lightweight official Python image
FROM python:3.11-slim

# Set the working directory inside the container (like "cd" into it)
WORKDIR /app

# Copy only requirements.txt first - Docker caches this layer,
# so re-builds are faster if only app code changes later
COPY requirements.txt .

# Install the Python dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code into the container
COPY . .

# Document that the app listens on port 5000 (informational)
EXPOSE 5000

# The command that runs when the container starts
CMD ["python", "app.py"]