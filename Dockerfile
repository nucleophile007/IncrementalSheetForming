# Use an official Python image
FROM continuumio/miniconda3:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the environment.yml to the container
COPY environment.yml /app/

# Install the Conda environment
RUN conda env create -f environment.yml

# Activate the environment and set it for future commands
RUN echo "conda activate rnd_env" >> ~/.bashrc

# Copy your project code to the container
COPY . /app/

# Set the default command to run when the container starts
CMD ["conda", "run", "-n", "rnd_env", "python", "app.py"]
