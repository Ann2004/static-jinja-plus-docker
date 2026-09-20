# Порт к StaticJinjaPlus в Docker

Этот репозиторий — порт: набор Dockerfile'ов и инструкций, которые позволяют собрать Docker-образы [StaticJinjaPlus](https://github.com/MrDave/StaticJinjaPlus) из его исходников на GitHub.

- Dockerfile - сборка на базе ubuntu
- Dockerfile.slim - сборка на базе python-slim

## Сборка разных версий Docker-образов
### 1. Образ `0.1.0` (ubuntu)

Вычисляем хеш архива версии 0.1.0:
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:0.1.0 .
```

### 2. Образ `0.1.1` (ubuntu)

Вычисляем хеш архива версии 0.1.1:
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:0.1.1 .
```

### 3. Образ `0.1.0-slim` (python-slim)

Вычисляем хеш архива версии 0.1.0:
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile.slim \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:0.1.0-slim .
```

### 4. Образ `0.1.1-slim` (python-slim)

Вычисляем хеш архива версии 0.1.1:
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile.slim \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:0.1.1-slim .
```

### 5. Образ `develop` (ubuntu)

Вычисляем хеш архива ветки main:
```
URL="https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz"
CHECKSUM=$(curl -sL "$URL" | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile \
  --build-arg ARCHIVE_URL="$URL" \
  --build-arg CHECKSUM="$CHECKSUM" \
  -t ваш-username/static-jinja-plus:develop .
```

### 6. Образ `develop-slim` (python-slim)

Вычисляем хеш архива ветки main:
```
URL="https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz"
CHECKSUM=$(curl -sL "$URL" | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile.slim \
  --build-arg ARCHIVE_URL="$URL" \
  --build-arg CHECKSUM="$CHECKSUM" \
  -t ваш-username/static-jinja-plus:develop-slim .
```

### 7. Образ `latest` (ubuntu)

Вычисляем хеш архива последней стабильной версии (сейчас 0.1.1):
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:latest .
```

### 8. Образ `slim` (python-slim)

Вычисляем хеш архива последней стабильной версии (сейчас 0.1.1):
```
CHECKSUM=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum | cut -d' ' -f1)
```

Собираем образ:
```
docker build \
  -f Dockerfile.slim \
  --build-arg ARCHIVE_URL=https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz \
  --build-arg CHECKSUM=$CHECKSUM \
  -t ваш-username/static-jinja-plus:slim .
```

