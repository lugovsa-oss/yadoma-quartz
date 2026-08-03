# Русскоязычный блог для Quartz 5 — первый рабочий комплект

Это **накладка на свежую установку Quartz 5**, а не копия самого движка. Такой способ не мешает обновлять Quartz и не создаёт отдельный форк ядра.

## 1. Установить Quartz 5

Требуются Node.js 22+ и npm 10.9.2+.

```bash
git clone https://github.com/jackyzha0/quartz.git
cd quartz
npm i
npx quartz create
```

В мастере выберите:

- template: `blog`
- content: `new`
- base URL: пока можно указать будущий домен или временное значение
- link resolution: `shortest`

## 2. Наложить этот комплект

Распакуйте архив рядом с каталогом Quartz.

### macOS / Linux

```bash
cd quartz-russian-blog-starter
./install-theme.sh /полный/путь/к/quartz
```

### Windows PowerShell

```powershell
cd quartz-russian-blog-starter
./Install-Theme.ps1 -Target "C:\полный\путь\к\quartz"
```

Файлы `quartz.config.yaml`, `quartz/styles/custom.scss` и демонстрационный `content/` будут заменены.

## 3. Установить плагины и запустить

```bash
cd /путь/к/quartz
npx quartz plugin install --from-config
npx quartz build --serve
```

Открыть: http://localhost:8080

## Что уже сделано

- русская локаль;
- книжная типографика;
- светлая бумажная палитра;
- тушевой фон левой панели;
- фото автора только на главной;
- hero только на главной;
- обычное HTML-меню Quartz, не картинка;
- пример структуры: `posts`, `books`, «О сайте», «Об авторе»;
- мобильная версия;
- RSS и sitemap.

## Что заменить в первую очередь

1. `configuration.pageTitle` в `quartz.config.yaml`.
2. Тот же заголовок в `content/index.md`.
3. Подзаголовок `мысли · книги · путь`.
4. Вступительный абзац на главной.
5. Демонстрационные записи.
6. `configuration.baseUrl` перед публикацией.

## Графические файлы

- `content/assets/avatar.webp`
- `content/assets/home-hero.webp`
- `content/assets/sidebar-ink.webp`

Их можно заменять, не трогая разметку и CSS, если сохранить имена и пропорции.

## Важное замечание

На этом этапе список «Последние записи» на главной ручной. Это сознательно: он надёжен и не требует собственного плагина. После проверки первого макета можно добавить автоматическую выборку последних публикаций отдельным компонентом.
