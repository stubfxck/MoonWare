# MoonWare — Library Usage Guide

A lightweight Roblox UI library: pages, sections, controls (toggles, sliders,
textboxes, keybinds, dropdowns, buttons, markdown, infoboxes), built-in
localization (RU/EN) and optional config persistence. This document covers
the public API only — how to *use* the library in your own script.

## Loading the library

```lua
local library = loadstring(game:HttpGet("<raw url of the library>"))()
```

`library` is the module table. Everything below is called on it or on the
objects it returns.

## Creating a window

```lua
local ui = library.new(nil, "RightShift", options)
```

- **1st argument** — reserved, pass `nil`.
- **2nd argument** — `Enum.KeyCode` (or its string name, e.g. `"RightShift"`)
  used to show/hide the window. Optional.
- **3rd argument** — optional table:
  - `ConfigAdapter` — see [Config persistence](#config-persistence).
  - `AutoSave` — boolean, defaults to `true` (config saves automatically on
    every change when a `configKey` is set).

Returns the window object (`ui` below). Calling `library.new(...)` again
destroys any previous window from the same library instance and creates a
fresh one.

## Pages

```lua
local page = ui:addPage(titleText)
```

`titleText` is either a plain string, or a localized table
`{ key = "unique.key", en = "English", ru = "Русский" }` (see
[Localization](#localization)). The first page you add is selected
automatically. The library appends its own **Info** page (credits +
language switcher) last, automatically — you don't need to add it yourself.

## Sections

```lua
local section = page:addSection(titleText)
```

Same `titleText` rules as pages. All controls below are added to a section,
not directly to a page.

## Controls

All control methods live on a `Section` object.

### `addButton(titleText, callback)`
```lua
section:addButton("Click me", function()
    print("clicked")
end)
```

### `addToggle(titleText, default, callback, disabled, configKey)`
```lua
local toggle = section:addToggle("Enable feature", false, function(value)
    print("toggled:", value)
end, false, "my_feature_enabled")
```
- `default: boolean`
- `callback: function(value: boolean)`
- `disabled: boolean` — greys the control out and blocks interaction
- `configKey: string?` — see [Config persistence](#config-persistence)
- Returns `{ Instance, Label, Get(), Set(value) }`

### `addSlider(titleText, default, min, max, callback, disabled, configKey, step)`
```lua
local slider = section:addSlider("Speed", 16, 0, 50, function(value)
    print("speed:", value)
end, false, "speed", 0.5)
```
- `step: number?` — increment size, defaults to `1` (e.g. `0.5` for
  half-unit precision)
- Dragging the bar **and** scrolling the mouse wheel over it both move the
  value in `step` increments
- Returns `{ Instance, Label, Get(), Set(value) }`

### `addTextbox(titleText, default, callback, configKey)`
```lua
section:addTextbox("Webhook URL", "", function(text, enterPressed)
    print(text)
end, "webhook_url")
```

### `addKeybind(titleText, defaultKeyCode, callback, changedCallback, configKey)`
```lua
section:addKeybind("Toggle noclip", Enum.KeyCode.N, function()
    print("key pressed")
end, function(newKey)
    print("rebound to", newKey.Name)
end)
```

### `addDropdown(titleText, list, callback, configKey)`
```lua
section:addDropdown("Mode", {"A", "B", "C"}, function(selected)
    print("selected:", selected)
end)
```

### `addMarkdown(text)`
```lua
section:addMarkdown("Visit **our** page: [link](https://example.com)")
```
Supports `**bold**`, `_italic_`, `` `code` `` (stripped to plain text) and
`[label](url)` links — clicking a link copies the URL and shows a toast.

### `addInfobox(titleText, bodyText)`
```lua
section:addInfobox("Note", "This feature is experimental.")
```
Static two-line text block. `titleText` may be `nil` (defaults to "Info"),
`""` (no title), a plain string, or a localized table.

## Localization

Any `titleText`/label parameter accepts either a plain string, or:

```lua
{ key = "unique.key", en = "English text", ru = "Русский текст" }
```

`key` must be unique across the whole window — it's how the library tracks
and re-applies the text when the language changes. The built-in **Info**
page ships a language dropdown (RU/EN); all localized labels update live
when the user switches.

## Config persistence

Pass a `configKey` to any control above to have its value automatically
registered, loaded and saved:

```lua
ui:RegisterConfig(key, defaultValue, validator, onChanged)
ui:GetConfig(key, fallback)
ui:SetConfig(key, value)
ui:SaveConfig()
ui:LoadConfig()
ui:ExportConfig() -- returns a JSON string snapshot
ui:ImportConfig(jsonString)
```

By default config lives only in memory for the current session. Pass a
different adapter via `options.ConfigAdapter` in `library.new`:

| Adapter | Usage | Behavior |
|---|---|---|
| `library.Adapters.Memory(seed)` | default | in-memory only, lost on script stop |
| `library.Adapters.File(fileName)` | `library.Adapters.File("my_config.json")` | persists via `readfile`/`writefile` (executor-provided) |
| `library.Adapters.RemoteFunction(remote)` | `library.Adapters.RemoteFunction(myRemoteFunction)` | persists via a server `RemoteFunction`, calling it with `"Load"` / `"Save", payload` |

A custom adapter is any table with `Read()` and `Write(payload)` methods.

## Notifications

```lua
ui:Notify(title, body, duration)
```

## Window lifecycle

```lua
ui:Toggle(force)                  -- show/hide the whole window (force: boolean?)
ui:SetMinimized(true)             -- collapse to just the title bar
ui:OnUnload(fnOrConnectionOrInstance) -- register cleanup, runs on Destroy
ui:Destroy(...)                   -- tears the UI down, runs every OnUnload callback
```

`OnUnload` accepts a function, an `RBXScriptConnection`, an `Instance`, or
any table exposing `Unload`/`Destroy`/`Disconnect` — whichever applies is
called automatically.

## Full example

```lua
local library = loadstring(game:HttpGet("<raw url>"))()
local ui = library.new(nil, "RightShift")

local page = ui:addPage({ key = "page.main", en = "Main", ru = "Главная" })
local section = page:addSection({ key = "section.demo", en = "Demo", ru = "Демо" })

section:addToggle({ key = "toggle.example", en = "Example Toggle", ru = "Пример тумблера" },
    false, function(value) print("toggled:", value) end, false, "example_toggle")

section:addSlider({ key = "slider.example", en = "Example Slider", ru = "Пример слайдера" },
    5, 0, 10, function(value) print("slider:", value) end, false, "example_slider", 0.5)

section:addButton({ key = "button.example", en = "Run", ru = "Запустить" }, function()
    ui:Notify("Demo", "Button pressed!")
end)

ui:OnUnload(function()
    print("UI destroyed, cleaning up")
end)
```
