# Stage 1: Build stage
FROM node:24-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy and install dependency files
COPY package.json yarn.lock ./
RUN yarn install

# Copy all source code 
COPY . .

# Build the app
RUN yarn build

# Stage 2: Production stage
FROM node:24-alpine

# Set the working directory inside the container
WORKDIR /app

# Install 'serve' to serve static build files
RUN yarn global add serve

# Copy the built files from the build stage
COPY --from=build /app/build ./build

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S user -G appgroup

# Change ownership of the app directory to the non-root user
RUN chown -R user:appgroup /app

# Open port 3000
EXPOSE 3000

# Switch to the non-root user
USER user 

# Serve the built app
CMD ["serve", "-s", "build"]