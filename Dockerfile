# Use a base image with Python, Git, and required tools
FROM python:3.10

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    git cmake swig

# Install Python dependencies
RUN pip install --no-cache-dir flask numpy plotly

# Clone and install PythonOCC
RUN git clone --recursive https://github.com/tpaviot/pythonocc-core.git
WORKDIR /pythonocc-core
RUN pip install .

# Set working directory to the application folder
WORKDIR /app
COPY . .

# Install remaining dependencies
RUN pip install -r requirements.txt

# Expose port (if running a web app)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
