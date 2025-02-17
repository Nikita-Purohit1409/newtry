# Use official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all the application files into the container
COPY . .

# Expose the default Next.js port
EXPOSE 3000

# Command to run the app in development mode (you can change it to 'npm run build && npm start' for production)
CMD ["npm", "run", "dev"]
