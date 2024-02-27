# Use the official Python image as the base image
FROM python:3.10.13-bookworm

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN rm requirements.txt

# Copy the app code
WORKDIR /app
COPY . /app

# Expose port 8000
EXPOSE 80

# Run gunicorn with four workers and bind it to port 8000
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:80", "wsgi:app"]
