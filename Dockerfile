# Use the official Node.js image as the base image
FROM node:22-alpine

RUN npm install -g pnpm

# Set the working directory in the container
WORKDIR /app

# Copy package.json, package-lock.json, and pnpm-lock.yaml
COPY package*.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN pnpm build

# Expose the port the app runs on
EXPOSE 3000

# Start the Next.js app
CMD ["pnpm", "run", "dev"]