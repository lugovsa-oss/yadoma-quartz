#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -f "$TARGET/package.json" || ! -d "$TARGET/quartz" ]]; then
  echo "Ошибка: '$TARGET' не похож на корень установленного Quartz 5."
  echo "Пример: ./install-theme.sh /path/to/quartz"
  exit 1
fi

cp "$SOURCE/quartz.config.yaml" "$TARGET/quartz.config.yaml"
mkdir -p "$TARGET/quartz/styles" "$TARGET/content"
cp "$SOURCE/quartz/styles/custom.scss" "$TARGET/quartz/styles/custom.scss"
cp -R "$SOURCE/content/." "$TARGET/content/"

echo "Файлы темы установлены."
echo "Теперь выполните:"
echo "  cd "$TARGET""
echo "  npx quartz plugin install --from-config"
echo "  npx quartz build --serve"
