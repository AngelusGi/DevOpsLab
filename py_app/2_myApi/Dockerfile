# Use the official Python image as the base image
FROM python:3.10.13-bookworm

ARG TARGETPLATFORM

COPY requirements.txt .

RUN \
  ARCH=$(case ${TARGETPLATFORM:-linux/amd64} in \
  "linux/amd64")   echo "x86-64bit" ;; \
  "linux/arm64")   echo "aarch64"   ;; \
  *)               echo ""          ;; esac) && \
  echo "ARCH=$ARCH" && \
  # Install build dependencies
  apt-get update && \
  apt-get install -y curl build-essential unixodbc-dev g++ apt-transport-https && \
  curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft-prod.gpg && \
  curl -sSL https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list && \
  apt-get update && \
  # Install ODBC Driver for SQL Server and PostgreSQL
  ACCEPT_EULA='Y' apt-get install -y msodbcsql18 odbc-postgresql && \
  # Install dependencies (pyobdc)
  pip install -r requirements.txt && rm requirements.txt && \
  # Cleanup build dependencies
  apt-get remove -y curl apt-transport-https debconf-utils g++ gcc rsync unixodbc-dev build-essential gnupg2 && \
  apt-get autoremove -y && apt-get autoclean -y \
  apt-get clean -y \
  apt-get -y upgrade


# Set the working directory
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the app code
COPY *.* /app

RUN ls -la /app
RUN ls -la /app/modules

# Expose port 8000
EXPOSE 80

# Run gunicorn with four workers and bind it to port 8000
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:80", "wsgi:app"]
