@echo off
setlocal enabledelayedexpansion

echo Building TicTacToe Docker image...
docker build -t tictactoe:latest .

echo Removing old container if it exists...
docker rm -f tictactoe >nul 2>&1

echo Starting TicTacToe container...
docker run -d ^
  --name tictactoe ^
  -p 8080:8080 ^
  --restart unless-stopped ^
  tictactoe:latest

echo.
echo ✓ App running at http://localhost:8080
echo ✓ View logs: docker logs -f tictactoe
pause
