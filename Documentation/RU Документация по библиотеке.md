# MoonWare — руководство по использованию библиотеки

Лёгкая UI-библиотека для Roblox: страницы, секции, элементы управления
(тумблеры, слайдеры, текстовые поля, клавиши, выпадающие списки, кнопки,
markdown, инфобоксы), встроенная локализация (RU/EN) и опциональное
сохранение конфига. В этом документе описан только публичный API — как
*использовать* библиотеку в своём скрипте.

## Загрузка библиотеки

```lua
local library = loadstring(game:HttpGet("<raw-ссылка на библиотеку>"))()
```

`library` — это таблица модуля. Всё, что описано ниже, вызывается либо на
ней, либо на объектах, которые она возвращает.

## Создание окна

```lua
local ui = library.new(nil, "RightShift", options)
```

- **1-й аргумент** — зарезервирован, передавайте `nil`.
- **2-й аргумент** — `Enum.KeyCode` (или его имя строкой, например
  `"RightShift"`) для показа/скрытия окна. Необязательный.
- **3-й аргумент** — необязательная таблица:
  - `ConfigAdapter` — см. [Сохранение конфига](#сохранение-конфига).
  - `AutoSave` — boolean, по умолчанию `true` (конфиг сохраняется
    автоматически при каждом изменении, если у элемента задан `configKey`).

Возвращает объект окна (`ui` ниже). Повторный вызов `library.new(...)`
уничтожает предыдущее окно этого экземпляра библиотеки и создаёт новое.

## Страницы

```lua
local page = ui:addPage(titleText)
```

`titleText` — либо обычная строка, либо локализованная таблица
`{ key = "unique.key", en = "English", ru = "Русский" }` (см.
[Локализацию](#локализация)). Первая добавленная страница выбирается
автоматически. Библиотека сама добавляет свою страницу **Info** (авторство +
переключатель языка) последней — добавлять её вручную не нужно.

## Секции

```lua
local section = page:addSection(titleText)
```

Те же правила для `titleText`, что и у страниц. Все элементы управления
ниже добавляются в секцию, а не напрямую в страницу.

## Элементы управления

Все методы ниже вызываются на объекте `Section`.

### `addButton(titleText, callback)`
```lua
section:addButton("Нажми меня", function()
    print("нажато")
end)
```

### `addToggle(titleText, default, callback, disabled, configKey)`
```lua
local toggle = section:addToggle("Включить фичу", false, function(value)
    print("переключено:", value)
end, false, "my_feature_enabled")
```
- `default: boolean`
- `callback: function(value: boolean)`
- `disabled: boolean` — делает элемент серым и блокирует взаимодействие
- `configKey: string?` — см. [Сохранение конфига](#сохранение-конфига)
- Возвращает `{ Instance, Label, Get(), Set(value) }`

### `addSlider(titleText, default, min, max, callback, disabled, configKey, step)`
```lua
local slider = section:addSlider("Скорость", 16, 0, 50, function(value)
    print("скорость:", value)
end, false, "speed", 0.5)
```
- `step: number?` — шаг значения, по умолчанию `1` (например, `0.5` для
  половинчатой точности)
- Значение можно менять как перетаскиванием, так и колёсиком мыши при
  наведении — оба способа двигают значение с шагом `step`
- Возвращает `{ Instance, Label, Get(), Set(value) }`

### `addTextbox(titleText, default, callback, configKey)`
```lua
section:addTextbox("URL вебхука", "", function(text, enterPressed)
    print(text)
end, "webhook_url")
```

### `addKeybind(titleText, defaultKeyCode, callback, changedCallback, configKey)`
```lua
section:addKeybind("Переключить ноуклип", Enum.KeyCode.N, function()
    print("клавиша нажата")
end, function(newKey)
    print("переназначено на", newKey.Name)
end)
```

### `addDropdown(titleText, list, callback, configKey)`
```lua
section:addDropdown("Режим", {"A", "B", "C"}, function(selected)
    print("выбрано:", selected)
end)
```

### `addMarkdown(text)`
```lua
section:addMarkdown("Загляните **к нам**: [ссылка](https://example.com)")
```
Поддерживает `**жирный**`, `_курсив_`, `` `код` `` (превращается в обычный
текст) и `[текст](ссылка)` — клик по ссылке копирует её в буфер и
показывает уведомление.

### `addInfobox(titleText, bodyText)`
```lua
section:addInfobox("Заметка", "Эта функция экспериментальная.")
```
Статичный блок из заголовка и текста. `titleText` может быть `nil`
(тогда заголовок по умолчанию — "Info"), `""` (без заголовка), обычной
строкой или локализованной таблицей.

## Локализация

Любой параметр вида `titleText`/подпись принимает либо обычную строку,
либо:

```lua
{ key = "unique.key", en = "English text", ru = "Русский текст" }
```

`key` должен быть уникальным в пределах всего окна — по нему библиотека
отслеживает элемент и обновляет текст при смене языка. Встроенная страница
**Info** содержит выпадающий список языка (RU/EN); весь локализованный
текст обновляется вживую при переключении.

## Сохранение конфига

Передайте `configKey` любому элементу выше, чтобы его значение
автоматически регистрировалось, загружалось и сохранялось:

```lua
ui:RegisterConfig(key, defaultValue, validator, onChanged)
ui:GetConfig(key, fallback)
ui:SetConfig(key, value)
ui:SaveConfig()
ui:LoadConfig()
ui:ExportConfig() -- возвращает JSON-строку со снапшотом
ui:ImportConfig(jsonString)
```

По умолчанию конфиг живёт только в памяти текущей сессии. Передайте
другой адаптер через `options.ConfigAdapter` в `library.new`:

| Адаптер | Использование | Поведение |
|---|---|---|
| `library.Adapters.Memory(seed)` | по умолчанию | только память, теряется при остановке скрипта |
| `library.Adapters.File(fileName)` | `library.Adapters.File("my_config.json")` | сохраняет через `readfile`/`writefile` (предоставляется экзекьютором) |
| `library.Adapters.RemoteFunction(remote)` | `library.Adapters.RemoteFunction(myRemoteFunction)` | сохраняет через серверный `RemoteFunction`, вызывая его с `"Load"` / `"Save", payload` |

Свой адаптер — это любая таблица с методами `Read()` и `Write(payload)`.

## Уведомления

```lua
ui:Notify(title, body, duration)
```

## Жизненный цикл окна

```lua
ui:Toggle(force)                  -- показать/скрыть окно целиком (force: boolean?)
ui:SetMinimized(true)             -- свернуть до строки заголовка
ui:OnUnload(fnOrConnectionOrInstance) -- зарегистрировать очистку, вызывается при Destroy
ui:Destroy(...)                   -- уничтожает UI, вызывает все OnUnload-колбэки
```

`OnUnload` принимает функцию, `RBXScriptConnection`, `Instance`, или любую
таблицу с методами `Unload`/`Destroy`/`Disconnect` — сработает то, что
применимо.

## Полный пример

```lua
local library = loadstring(game:HttpGet("<raw-ссылка>"))()
local ui = library.new(nil, "RightShift")

local page = ui:addPage({ key = "page.main", en = "Main", ru = "Главная" })
local section = page:addSection({ key = "section.demo", en = "Demo", ru = "Демо" })

section:addToggle({ key = "toggle.example", en = "Example Toggle", ru = "Пример тумблера" },
    false, function(value) print("переключено:", value) end, false, "example_toggle")

section:addSlider({ key = "slider.example", en = "Example Slider", ru = "Пример слайдера" },
    5, 0, 10, function(value) print("слайдер:", value) end, false, "example_slider", 0.5)

section:addButton({ key = "button.example", en = "Run", ru = "Запустить" }, function()
    ui:Notify("Demo", "Кнопка нажата!")
end)

ui:OnUnload(function()
    print("UI уничтожен, чищу за собой")
end)
```
