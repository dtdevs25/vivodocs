# Build Frontend
FROM node:20-alpine AS build-frontend
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ ./
RUN npm run build

# Build Backend
FROM node:20-alpine AS build-backend
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm install
COPY backend/ ./
RUN npm run build

# Production Image
FROM node:20-alpine
WORKDIR /app
COPY --from=build-backend /app/backend/dist ./backend/dist
COPY --from=build-backend /app/backend/package*.json ./backend/
COPY --from=build-frontend /app/frontend/dist ./frontend/dist

WORKDIR /app/backend
RUN npm install --only=production

EXPOSE 3000
CMD ["node", "dist/server.js"]
