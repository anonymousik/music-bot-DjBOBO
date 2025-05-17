# Discord MusicBOT 2.0
Bazowany na bocie autorstwa: [iColtz](https://github.com/iColtz)

Bot muzyczny na Discorda oparty o `discord.js` i `simple-youtube-api`.

## Instalacja i uruchomienie

### Wymagania

- Node.js w wersji 12 lub wyższej: [Pobierz Node.js](https://nodejs.org/)
- Yarn: [Instrukcja instalacji Yarn](https://yarnpkg.com/getting-started/install)

### Szybki start (zalecane)

1. Sklonuj repozytorium:
    ```bash
    git clone https://github.com/anonymousik/music-bot-DjBOBO.git
    cd music-bot-DjBOBO
    ```

2. Uruchom automatyczny skrypt przygotowujący środowisko:
    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

3. Uzupełnij plik `config.yml` swoimi danymi:
    - `token`: Twój Discord Bot Token ([instrukcja](https://discordjs.guide/preparations/setting-up-a-bot-application.html#creating-your-bot))
    - `youtubeAPI`: Klucz YouTube Data API v3 ([instrukcja](https://developers.google.com/youtube/v3/getting-started))
    - `prefix`: np. `!`

4. Uruchom bota:
    ```bash
    yarn start
    ```

---

### Ręczna instalacja

1. Zainstaluj zależności:
    ```bash
    yarn install
    ```
2. Zmień nazwę pliku `config.example.yml` na `config.yml` i uzupełnij danymi konfiguracyjnymi.
3. Uruchom bota poleceniem `yarn start`.

---

## Przykładowy plik konfiguracyjny

```yaml
token: 'TWÓJ_DISCORD_BOT_TOKEN'
youtubeAPI: 'TWÓJ_YOUTUBE_API_KEY'
prefix: '!'

## Authors
> © [iColtz](https://github.com/iColtz).
> © [Anonymousik] (https://github.com/Anonymousik).