# Use an official Python runtime as a parent image
FROM python:3.9.13

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Start the Django application
CMD ["python","manage.py", "runserver", "0.0.0.0:8000"]
