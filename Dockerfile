# Use a base image with Python, Git, and required tools
FROM python:3.10

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git cmake swig libgl1-mesa-dev libglu1-mesa-dev

# Clone PythonOCC repository
RUN git clone --recursive https://github.com/tpaviot/pythonocc-core.git
WORKDIR /pythonocc-core

# Install dependencies for PythonOCC
RUN pip install -r requirements.txt  # Install dependencies first
RUN cmake . -DOCC_INCLUDE_DIR=/usr/include/opencascade -DOCC_LIBRARY_DIR=/usr/lib
RUN make -j$(nproc)
RUN make install

# Set working directory to the application folder
WORKDIR /app
COPY . .

# Install remaining dependencies
RUN pip install -r requirements.txt

# Expose port (if running a web app)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
