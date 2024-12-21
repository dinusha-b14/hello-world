FROM node:22-bullseye-slim AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package.json ./
COPY package-lock.json ./
COPY tsconfig.json ./
COPY src ./src

# Install the dependencies
RUN npm install

# Build the app
RUN npm run build

FROM node:22-bullseye-slim AS production

# Set the working directory
WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules

# Expose the port
EXPOSE 3000

# Start the app
CMD ["node", "dist/server.js"]
