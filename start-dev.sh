#!/bin/bash
set -e

echo "======================================"
echo "Starting SmartPOS Development"
echo "======================================"

echo ""
echo "Starting Docker..."
docker compose up -d

echo ""
echo "Waiting for PostgreSQL..."
sleep 5

echo ""
echo "Starting Backend..."
cd backend

export PORT=4001
npm run dev