# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app 

# Copy the current directory contents into the container at /app
COPY . /app

# Exclude/Remove .ipynb_checkpoints
RUN rm -rf /app/src/.ipynb_checkpoints

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir numpy scikit-learn imbalanced-learn pandas seaborn matplotlib jupyter notebook

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Generate Jupyter configuration
RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py

# Define a volume for the working directory
# or create in the CLI via -> docker volume create my_volume
VOLUME /app

RUN bash .devcontainer/setup_container.bash
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]