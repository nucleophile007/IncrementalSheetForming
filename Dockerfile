# Use Python as the base image
FROM python:3.10

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git cmake swig libgl1-mesa-dev libglu1-mesa-dev \
    libfreetype6-dev libx11-dev libxext-dev libxmu-dev

# Set working directory
WORKDIR /app

# Clone the PythonOCC repository
RUN git clone --recursive https://github.com/tpaviot/pythonocc-core.git /pythonocc-core
WORKDIR /pythonocc-core

# Build and install PythonOCC manually
RUN cmake . -DCMAKE_INSTALL_PREFIX=/usr/local
RUN make -j$(nproc)
RUN make install

# Go back to the main app directory
WORKDIR /app

# Copy the application code and requirements file
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port (if your app runs on Flask or FastAPI)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
