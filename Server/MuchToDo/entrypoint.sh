#!/bin/sh
# Write .env file from environment variables so Viper can find it
cat > /root/.env << ENVEOF
MONGO_URI=${MONGO_URI}
REDIS_ADDR=${REDIS_ADDR}
PORT=${PORT:-8080}
DB_NAME=${DB_NAME:-starttech}
JWT_SECRET_KEY=${JWT_SECRET_KEY}
ENABLE_CACHE=${ENABLE_CACHE:-false}
LOG_LEVEL=${LOG_LEVEL:-info}
LOG_FORMAT=${LOG_FORMAT:-json}
ENVEOF

echo "Starting app with config:"
cat /root/.env
exec ./main
