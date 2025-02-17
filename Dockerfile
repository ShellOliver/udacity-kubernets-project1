# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

COPY techtrends/. .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the application code

# Expose the port the app will run on
EXPOSE 3111

# Set the environment variable to enable debug logs
ENV FLASK_ENV=production

# use in debug mode
ENV FLASK_DEBUG=True

RUN python init_db.py
# Run the command to start the app when the container starts
CMD ["flask", "run", "--host=0.0.0.0", "--port=3111"]