#!/usr/bin/env bash
# runserver.sh - Script para entornos Unix/WSL/macOS que activa venv si existe y arranca Django dev server
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

if [ -f "venv/bin/activate" ]; then
  . venv/bin/activate
elif [ -f ".venv/bin/activate" ]; then
  . .venv/bin/activate
fi

echo "Starting Django dev server on http://127.0.0.1:8000/"
python manage.py runserver 127.0.0.1:8000
