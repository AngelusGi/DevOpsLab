# Use the official Python image as the base image
FROM python:3.10.13-bookworm

# Update base image environment
RUN apt-get update
RUN apt-get upgrade -y

# install required packages in base image environment
RUN apt-get autoclean -y

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN rm requirements.txt

# Copy the app code
WORKDIR /app
COPY . /app
RUN rm requirements.txt

# Expose port
EXPOSE 5000

# Run python flask app and bind it to port 5000
CMD ["python", "main.py"]
