# Pull the python image from docker hub [cached]
FROM python:alpine3.10

# Create a working directory called "app" [cached]
WORKDIR /app

# Setup environment variables using the flask command [cached]
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# COPY requirements.txt from the project root folder to the "app" working directory [cached]
COPY ./requirements.txt /app/requirements.txt

# Install the necessary dependencies [cached]
RUN pip3 install -r requirements.txt

# Copy the current directory in the project to the workdir in the image
COPY .. /app

# Expose the port the application will use in the container
EXPOSE 5000

# Command to run the application in the container
CMD ["flask", "run"]