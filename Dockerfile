FROM debian:bookworm-slim AS builder

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Загрузка последней версии SentryShot
RUN mkdir -p /app
WORKDIR /app
RUN curl -L -o sentryshot.tar.gz https://codeberg.org/sentryshot/sentryshot/releases/download/v0.2.26/sentryshot-v0.2.26-x86_64.tar.gz \
    && tar -xzvf sentryshot.tar.gz \
    && rm sentryshot.tar.gz

# Финальный образ
FROM debian:bookworm-slim

# Установка необходимых зависимостей
RUN apt-get update && apt-get install -y \
    libavcodec-dev \
    libavutil-dev \
    libusb-1.0-0-dev \
    tzdata \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Создание директорий для данных
RUN mkdir -p /app/configs /app/storage /app/logs

# Копирование бинарных файлов из builder
COPY --from=builder /app/ /app/

# Рабочая директория
WORKDIR /app

# Открываем порт
EXPOSE 2020

# Запуск приложения
CMD ["./sentryshot", "run", "--config", "/app/configs/sentryshot.toml"]
