#!/bin/bash

set -e

echo "=== Wykrywanie systemu operacyjnego ==="
OS="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if grep -qi microsoft /proc/version 2>/dev/null; then
    OS="wsl"
  else
    OS="linux"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  OS="windows"
fi

echo "Wykryto system: $OS"
echo ""

# Funkcja instalująca Node.js na różnych systemach
install_node() {
  echo "Node.js nie wykryto. Instaluję Node.js..."
  case $OS in
    linux)
      curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
      sudo apt-get install -y nodejs
      ;;
    macos)
      if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew nie wykryto. Zainstaluj Homebrew: https://brew.sh/"
        exit 1
      fi
      brew install node
      ;;
    wsl)
      curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
      sudo apt-get install -y nodejs
      ;;
    *)
      echo "Automatyczna instalacja Node.js nieobsługiwana na tym systemie. Zainstaluj ręcznie: https://nodejs.org/"
      exit 1
      ;;
  esac
}

# Funkcja instalująca Yarn na różnych systemach
install_yarn() {
  echo "Yarn nie wykryto. Instaluję Yarn..."
  case $OS in
    linux|wsl)
      sudo npm install -g yarn
      ;;
    macos)
      if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew nie wykryto. Zainstaluj Homebrew: https://brew.sh/"
        exit 1
      fi
      brew install yarn
      ;;
    *)
      echo "Automatyczna instalacja Yarn nieobsługiwana na tym systemie. Zainstaluj ręcznie: https://classic.yarnpkg.com/lang/en/docs/install/"
      exit 1
      ;;
  esac
}

echo "=== Sprawdzanie Node.js ==="
if ! command -v node >/dev/null 2>&1; then
  install_node
else
  echo "Node.js wersja: $(node -v)"
fi

echo ""
echo "=== Sprawdzanie Yarn ==="
if ! command -v yarn >/dev/null 2>&1; then
  install_yarn
else
  echo "Yarn wersja: $(yarn -v)"
fi

echo ""
echo "=== Instalacja zależności projektu ==="
yarn install

echo ""
echo "=== Przygotowanie pliku konfiguracyjnego ==="
if [ ! -f config.yml ]; then
  if [ -f config.example.yml ]; then
    cp config.example.yml config.yml
    echo "Skopiowano config.example.yml do config.yml"
  else
    echo "Brak pliku config.example.yml! Pobierz go z repozytorium."
    exit 1
  fi
else
  echo "config.yml już istnieje."
fi

echo ""
echo "=== GOTOWE! ==="
echo "Uzupełnij plik config.yml swoimi danymi:"
echo "  - token: 'TWÓJ_DISCORD_BOT_TOKEN'"
echo "  - youtubeAPI: 'TWÓJ_YOUTUBE_API_KEY'"
echo "  - prefix: '!'"
echo ""
echo "Aby uruchomić bota, wpisz: yarn start"