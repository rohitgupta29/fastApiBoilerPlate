# Use an official Python runtime as a parent image
FROM python:3.10

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install core dependencies.
RUN apt-get update && apt-get install -y libpq-dev build-essential

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside the container
EXPOSE 80

# Run app.py

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
