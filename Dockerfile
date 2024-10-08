# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the app directory into the container
COPY app /app

# Copy required files to the appropriate locations inside the container
COPY SEPTARegionalRailStations2016 /app/SEPTARegionalRailStations2016
COPY Metro_Stations_Regional.geojson /app/Metro_Stations_Regional.geojson
COPY septa_outermost_stations.json /app/septa_outermost_stations.json
COPY dc_metro_outermost_stations.json /app/dc_metro_outermost_stations.json

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python", "app.py"]
