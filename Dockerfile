# Use a supported Debian base (bullseye)
FROM python:3.10-slim-bullseye

# Set working directory
WORKDIR /Jisshu-filter-bot
RUN chmod 777 /Jisshu-filter-bot

# Install git (no cache, minimal size)
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .
RUN chmod +x start.sh

# Start the bot
CMD ["bash", "start.sh"]
