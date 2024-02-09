# Use the official Python image as the base image
FROM python:3.13.0a3-slim

# Set the working directory
WORKDIR /app

# Upgrade debian packages on base image
RUN apt update
RUN apt -y upgrade

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the app code
COPY app.py .
COPY wsgi.py .

# Expose port 8000
EXPOSE 80

# Run gunicorn with four workers and bind it to port 8000
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:80", "wsgi:app"]
