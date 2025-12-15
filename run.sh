#!/usr/bin/env sh
set -e

echo "🎮 Building TicTacToe Docker image..."
docker build -t tictactoe:latest .

echo "🛑 Removing old container (if exists)..."
docker rm -f tictactoe 2>/dev/null || true

echo "▶️  Starting TicTacToe container..."
docker run -d \
  --name tictactoe \
  -p 8080:8080 \
  --restart unless-stopped \
  tictactoe:latest

echo "✅ App running at http://localhost:8080"
echo "📊 View logs: docker logs -f tictactoe"
