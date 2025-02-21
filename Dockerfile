# Use Node.js base image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Install JSON Server globally
RUN npm install -g json-server concurrently

# Copy all project files to the container
COPY . .

# Build the Next.js app
RUN npm run build

# Expose ports for both services
EXPOSE 3000 3001

# Run Next.js and JSON Server together
CMD concurrently "npm run start" "json-server --watch db.json --port 3001"
