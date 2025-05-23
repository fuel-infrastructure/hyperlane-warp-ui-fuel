# syntax=docker/dockerfile:1

FROM node:18

# Set the working directory inside the container.
WORKDIR /app

# Enable Corepack and ensure the correct Yarn version is used
RUN corepack enable
RUN corepack prepare yarn@4.5.0 --activate

# Copy the rest of the application code to the container.
COPY . .

# Install dependencies.
RUN yarn install

# Build the application.
RUN yarn build

CMD ["yarn", "start"]