# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.8-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY techtrends/requirements.txt .

# Install any dependencies the application needs
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY techtrends/. .

# Run app.py when the container launches
RUN python init_db.py
CMD ["python", "app.py"]
