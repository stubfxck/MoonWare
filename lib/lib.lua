--!strict

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LOCAL_PLAYER = Players.LocalPlayer

local BRAND = table.freeze({
	ProductName = "MoonWare",
	GuiName = "MoonWare",
	DiscordUrl = "https://discord.gg/SHGng2D9te",
	Version = 1,
	Debug = true,
	Theme = table.freeze({
		Background = Color3.fromRGB(18, 18, 20),
		Glow = Color3.fromRGB(0, 0, 0),
		Accent = Color3.fromRGB(10, 10, 12),
		LightContrast = Color3.fromRGB(31, 31, 33),
		DarkContrast = Color3.fromRGB(10, 10, 12),
		TextColor = Color3.fromRGB(252, 249, 224),
		MutedText = Color3.fromRGB(190, 184, 158),
		Border = Color3.fromRGB(56, 54, 47),
		Danger = Color3.fromRGB(220, 82, 72),
		Minimize = Color3.fromRGB(232, 218, 145),
	}),
	Localization = table.freeze({
		Default = "ru",
		Allowed = table.freeze({"ru", "en"}),
		Urls = table.freeze({
			ru = "https://raw.githubusercontent.com/stubfxck/MoonWare/refs/heads/main/localization/ru.json",
			en = "https://raw.githubusercontent.com/stubfxck/MoonWare/refs/heads/main/localization/en.json",
		}),
	}),
})

local T = BRAND.Theme
local Library = {}
Library.__index = Library
local Page = {}
Page.__index = Page
local Section = {}
Section.__index = Section

local function create(className: string, props: {[string]: any}?, children: {Instance}?): Instance
	local object = Instance.new(className)
	for property, value in pairs(props or {}) do
		local ok, err = pcall(function()
			(object :: any)[property] = value
		end)
		if not ok then
			warn("MOONWARE UI: property " .. tostring(property) .. " on " .. tostring(className) .. " could not be applied because " .. tostring(err))
		end
	end
	for _, child in ipairs(children or {}) do
		pcall(function() child.Parent = object end)
	end
	return object
end

local function moonwareWarn(message: string)
	warn("MOONWARE UI: " .. tostring(message))
end

local function safeDestroy(object: any)
	pcall(function()
		if typeof(object) == "Instance" and object.Parent then object:Destroy() end
	end)
end

local function safeCreate(className: string, props: {[string]: any}?, children: {Instance}?): Instance?
	local ok, result = pcall(function()
		return create(className, props, children)
	end)
	if ok then return result end
	moonwareWarn(className .. " could not be displayed because " .. tostring(result))
	return nil
end

local function protectUi(label: string, cleanup: any, callback: () -> any): (boolean, any)
	local ok, result = xpcall(callback, debug.traceback)
	if not ok then
		safeDestroy(cleanup)
		moonwareWarn(label .. " could not be displayed because " .. tostring(result))
		return false, nil
	end
	return true, result
end

local function protectCallback(label: string, callback: any, ...: any)
	if type(callback) ~= "function" then return end
	local args = table.pack(...)
	task.spawn(function()
		local ok, err = xpcall(function()
			callback(table.unpack(args, 1, args.n))
		end, debug.traceback)
		if not ok then moonwareWarn(label .. " callback failed because " .. tostring(err)) end
	end)
end

local function safeConnect(signal: any, label: string, callback: (...any) -> ())
	local ok, connection = pcall(function()
		return signal:Connect(function(...)
			local args = table.pack(...)
			local success, err = xpcall(function()
				callback(table.unpack(args, 1, args.n))
			end, debug.traceback)
			if not success then moonwareWarn(label .. " event failed because " .. tostring(err)) end
		end)
	end)
	if not ok then moonwareWarn(label .. " event could not be connected because " .. tostring(connection)) end
	return ok and connection or nil
end

local function corner(radius: number): UICorner
	return create("UICorner", {CornerRadius = UDim.new(0, radius)}) :: UICorner
end

local function stroke(color: Color3, thickness: number?): UIStroke
	return create("UIStroke", {Color = color, Thickness = thickness or 1, Transparency = 0}) :: UIStroke
end

local function tween(object: Instance, duration: number, props: {[string]: any})
	TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end


local function softTween(object: Instance, props: {[string]: any})
	TweenService:Create(object, TweenInfo.new(0.16, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), props):Play()
end

local function tryCopy(text: string): boolean
	local env = (getgenv and getgenv()) or _G
	local setClipboard = (env and (env.setclipboard or env.toclipboard)) or setclipboard or toclipboard
	if typeof(setClipboard) == "function" then
		local ok = pcall(setClipboard, text)
		return ok == true
	end
	return false
end

local function markdownRuns(text: string): {any}
	local runs = {}
	local index = 1

	while index <= #text do
		local linkStart, linkEnd, label, url = string.find(text, "%[([^%]]+)%]%(([^%)]+)%)", index)

		if not linkStart then
			local tail = string.sub(text, index)
			if tail ~= "" then table.insert(runs, {Text = tail, Link = nil}) end
			break
		end

		if linkStart > index then
			table.insert(runs, {Text = string.sub(text, index, linkStart - 1), Link = nil})
		end

		table.insert(runs, {Text = label, Link = url})
		index = linkEnd + 1
	end

	return runs
end

local function stripBasicMarkdown(text: string): string
	local result = tostring(text or "")
	result = string.gsub(result, "%*%*(.-)%*%*", "%1")
	result = string.gsub(result, "__(.-)__", "%1")
	result = string.gsub(result, "%*(.-)%*", "%1")
	result = string.gsub(result, "_(.-)_", "%1")
	result = string.gsub(result, "`(.-)`", "%1")
	return result
end

local function estimateTextWidth(text: string): number
	return math.max(36, math.min(430, #tostring(text or "") * 7 + 10))
end

local function enableSmoothScroll(frame: ScrollingFrame)
	-- Keep native Roblox scrolling. Custom tweened CanvasPosition made scroll feel too slow.
	frame.ScrollingDirection = Enum.ScrollingDirection.Y
	frame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
end

local function lockProperty(object: Instance, property: string, expected: any)
	(object :: any)[property] = expected
	object:GetPropertyChangedSignal(property):Connect(function()
		if (object :: any)[property] ~= expected then
			(object :: any)[property] = expected
		end
	end)
end

local function lockColor(object: Instance, property: string, expected: Color3)
	lockProperty(object, property, expected)
end

local function makeDraggable(handle: GuiObject, target: GuiObject)
	local dragging = false
	local dragInput: InputObject? = nil
	local dragStart = Vector3.zero
	local startPosition = target.Position

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPosition = target.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	handle.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			local delta = input.Position - dragStart
			target.Position = UDim2.new(
				startPosition.X.Scale, startPosition.X.Offset + delta.X,
				startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
			)
		end
	end)
end

local function clampNumber(value: any, minValue: any, maxValue: any): number
	local minNumeric = tonumber(minValue) or 0
	local maxNumeric = tonumber(maxValue)
	if maxNumeric == nil then
		maxNumeric = minNumeric
		minNumeric = 0
	end
	if maxNumeric < minNumeric then
		minNumeric, maxNumeric = maxNumeric, minNumeric
	end
	local numeric = tonumber(value) or minNumeric
	if numeric < minNumeric then return minNumeric end
	if numeric > maxNumeric then return maxNumeric end
	return numeric
end

local function clamp01(value: any): number
	local numeric = tonumber(value) or 0
	if numeric < 0 then return 0 end
	if numeric > 1 then return 1 end
	return numeric
end

local function isSafeConfigValue(value: any, depth: number?): boolean
	depth = depth or 0
	if depth > 6 then return false end
	local kind = typeof(value)
	if kind == "nil" or kind == "boolean" or kind == "number" or kind == "string" then
		return true
	end
	if kind == "table" then
		for key, child in pairs(value) do
			if typeof(key) ~= "string" and typeof(key) ~= "number" then return false end
			if not isSafeConfigValue(child, depth + 1) then return false end
		end
		return true
	end
	return false
end

local function deepCopy(value: any): any
	if typeof(value) ~= "table" then return value end
	local result = {}
	for key, child in pairs(value) do result[key] = deepCopy(child) end
	return result
end

local function enumKeyCodeFrom(value: any, fallback: Enum.KeyCode?): Enum.KeyCode?
	if typeof(value) == "EnumItem" and value.EnumType == Enum.KeyCode then return value end
	if typeof(value) == "string" then return Enum.KeyCode[value] or fallback end
	return fallback
end


local LOAD_FAILED_MESSAGE = "failed to load UI"
local activeLocale = {}

assert(LOCAL_PLAYER, "MoonWare must run on the client (LocalScript)")

local function isAllowedLocale(locale: any): boolean
	if type(locale) ~= "string" then return false end
	for _, item in ipairs(BRAND.Localization.Allowed) do
		if item == locale then return true end
	end
	return false
end

local function httpGetJson(url: string): any
	if type(url) ~= "string" or url == "" then return nil end
	local raw: any = nil
	local ok = pcall(function()
		if game.HttpGet then raw = game:HttpGet(url) end
	end)
	if not ok or type(raw) ~= "string" then return nil end
	local decodedOk, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
	if decodedOk and type(decoded) == "table" then return decoded end
	return nil
end

-- Адаптер по умолчанию: только память текущего запуска.
local MemoryAdapter = {}
MemoryAdapter.__index = MemoryAdapter
function MemoryAdapter.new(seed: {[string]: any}?)
	return setmetatable({_payload = deepCopy(seed or {})}, MemoryAdapter)
end
function MemoryAdapter:Read()
	return deepCopy(self._payload)
end
function MemoryAdapter:Write(payload)
	self._payload = deepCopy(payload)
	return true
end


local FileAdapter = {}
FileAdapter.__index = FileAdapter

local function normalizeConfigFileName(fileName: string?): string
	local name = tostring(fileName or "config.json")
	name = string.gsub(name, "^MoonWare/", "")
	name = string.gsub(name, "^configs/", "")
	assert(string.match(name, "^[%w%._%- ]+%.json$") ~= nil, "Config file name must be a safe .json name")
	return "MoonWare/configs/" .. name
end

local function ensureConfigFolder()
	local isfolderFn = isfolder
	local makefolderFn = makefolder
	if typeof(makefolderFn) ~= "function" then return end
	if typeof(isfolderFn) ~= "function" or not isfolderFn("MoonWare") then
		pcall(makefolderFn, "MoonWare")
	end
	if typeof(isfolderFn) ~= "function" or not isfolderFn("MoonWare/configs") then
		pcall(makefolderFn, "MoonWare/configs")
	end
end

function FileAdapter.new(fileName: string?)
	local path = normalizeConfigFileName(fileName)
	return setmetatable({fileName = path}, FileAdapter)
end

function FileAdapter:Read()
	local readfileFn = readfile
	local isfileFn = isfile
	if typeof(readfileFn) ~= "function" or typeof(isfileFn) ~= "function" or not isfileFn(self.fileName) then
		return nil
	end
	local ok, raw = pcall(readfileFn, self.fileName)
	if not ok or type(raw) ~= "string" then return nil end
	local decodedOk, payload = pcall(function() return HttpService:JSONDecode(raw) end)
	return decodedOk and payload or nil
end

function FileAdapter:Write(payload)
	local writefileFn = writefile
	if typeof(writefileFn) ~= "function" then return false end
	ensureConfigFolder()
	local ok, encoded = pcall(function() return HttpService:JSONEncode(payload) end)
	if not ok then return false end
	local saved = pcall(writefileFn, self.fileName, encoded)
	return saved == true
end


-- Безопасный Studio-адаптер: клиент обращается к вашему серверному RemoteFunction.
local function remoteFunctionAdapter(remote: RemoteFunction)
	assert(remote and remote:IsA("RemoteFunction"), "Expected RemoteFunction")
	return {
		Read = function()
			local ok, result = pcall(function() return remote:InvokeServer("Load") end)
			if ok and type(result) == "table" then return result end
			return {}
		end,
		Write = function(_, payload)
			local ok, result = pcall(function() return remote:InvokeServer("Save", payload) end)
			return ok and result == true
		end,
	}
end

Library.Adapters = table.freeze({
	Memory = MemoryAdapter.new,
	File = FileAdapter.new,
	RemoteFunction = remoteFunctionAdapter,
})

local function validateAdapter(adapter: any)
	assert(type(adapter) == "table", "ConfigAdapter must be a table")
	assert(type(adapter.Read) == "function", "ConfigAdapter.Read is missing")
	assert(type(adapter.Write) == "function", "ConfigAdapter.Write is missing")
end

function Library.new(_ignoredTitle: any?, toggleKey: any?, options: {[string]: any}?): any
	options = options or {}
	local playerGui = LOCAL_PLAYER:WaitForChild("PlayerGui")
	local old = playerGui:FindFirstChild(BRAND.GuiName)
	if old then old:Destroy() end

	local gui = create("ScreenGui", {
		Name = BRAND.GuiName,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 100,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = playerGui,
	}) :: ScreenGui
	lockProperty(gui, "Name", BRAND.GuiName)

	local main = create("Frame", {
		Name = "Main",
		Size = UDim2.fromOffset(511, 428),
		Position = UDim2.new(0.5, -255, 0.5, -214),
		BackgroundColor3 = T.Background,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Parent = gui,
	}, {corner(6), stroke(T.Border, 1)}) :: Frame
	lockColor(main, "BackgroundColor3", T.Background)

	local glow = create("Frame", {
		Name = "Glow",
		Size = UDim2.new(1, 20, 1, 20),
		Position = UDim2.fromOffset(-10, -10),
		BackgroundColor3 = T.Glow,
		BackgroundTransparency = 0.55,
		BorderSizePixel = 0,
		ZIndex = 0,
		Parent = main,
	}, {corner(10)}) :: Frame
	lockColor(glow, "BackgroundColor3", T.Glow)

	local topbar = create("Frame", {
		Name = "TopBar",
		Size = UDim2.new(1, 0, 0, 38),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = main,
	}, {corner(6)}) :: Frame
	lockColor(topbar, "BackgroundColor3", T.Accent)

	local topbarCover = create("Frame", {
		Name = "SquareBottom",
		Size = UDim2.new(1, 0, 0, 8),
		Position = UDim2.new(0, 0, 1, -8),
		BackgroundColor3 = T.Accent,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = topbar,
	}) :: Frame
	lockColor(topbarCover, "BackgroundColor3", T.Accent)

	local title = create("TextLabel", {
		Name = "Title",
		Size = UDim2.new(1, -82, 1, 0),
		Position = UDim2.fromOffset(12, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Text = BRAND.ProductName,
		TextColor3 = T.TextColor,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 6,
		Parent = topbar,
	}) :: TextLabel
	lockProperty(title, "Text", BRAND.ProductName)
	lockColor(title, "TextColor3", T.TextColor)

	local close = create("TextButton", {
		Name = "CloseButton",
		Size = UDim2.fromOffset(22, 22),
		Position = UDim2.new(1, -28, 0, 8),
		BackgroundColor3 = T.DarkContrast,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "×",
		TextColor3 = T.TextColor,
		TextSize = 16,
		AutoButtonColor = false,
		ZIndex = 7,
		Parent = topbar,
	}, {corner(4)}) :: TextButton

	local minimize = create("TextButton", {
		Name = "MinimizeButton",
		Size = UDim2.fromOffset(22, 22),
		Position = UDim2.new(1, -54, 0, 8),
		BackgroundColor3 = T.DarkContrast,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamBold,
		Text = "−",
		TextColor3 = T.TextColor,
		TextSize = 15,
		AutoButtonColor = false,
		ZIndex = 7,
		Parent = topbar,
	}, {corner(4)}) :: TextButton

	local sidebar = create("Frame", {
		Name = "Pages",
		Size = UDim2.new(0, 126, 1, -38),
		Position = UDim2.fromOffset(0, 38),
		BackgroundColor3 = T.DarkContrast,
		BorderSizePixel = 0,
		ZIndex = 2,
		Parent = main,
	}) :: Frame
	lockColor(sidebar, "BackgroundColor3", T.DarkContrast)

	local pagesContainer = create("ScrollingFrame", {
		Name = "Pages_Container",
		Size = UDim2.new(1, -14, 1, -42),
		Position = UDim2.fromOffset(7, 8),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 0,
		Parent = sidebar,
	}, {
		create("UIListLayout", {Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder}),
	}) :: ScrollingFrame
	enableSmoothScroll(pagesContainer)

	local divider = create("Frame", {
		Name = "BadgeDivider",
		Size = UDim2.new(1, -16, 0, 1),
		Position = UDim2.new(0, 8, 1, -34),
		BackgroundColor3 = T.Border,
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = sidebar,
	}) :: Frame
	lockColor(divider, "BackgroundColor3", T.Border)

	local badge = create("TextLabel", {
		Name = "PlayerBadge",
		Size = UDim2.new(1, -16, 0, 28),
		Position = UDim2.new(0, 8, 1, -32),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold,
		Text = LOCAL_PLAYER.Name,
		TextColor3 = Color3.fromRGB(180, 180, 175),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 4,
		Parent = sidebar,
	}) :: TextLabel

	local adapter = options.ConfigAdapter or MemoryAdapter.new()
	validateAdapter(adapter)
	local self = setmetatable({
		container = gui,
		main = main,
		pagesContainer = pagesContainer,
		pages = {},
		focusedPage = nil,
		visible = true,
		minimized = false,
		connections = {},
		unloadCallbacks = {},
		configAdapter = adapter,
		configSchema = {},
		configValues = {},
		configListeners = {},
		autoSave = options.AutoSave ~= false,
		locale = BRAND.Localization.Default,
		localeData = {},
		localizationUrls = BRAND.Localization.Urls,
		appLocales = {},
		localeWatchers = {},
	}, Library)

	makeDraggable(topbar, main)
	close.MouseEnter:Connect(function() tween(close, 0.12, {BackgroundColor3 = T.Danger}) end)
	close.MouseLeave:Connect(function() tween(close, 0.12, {BackgroundColor3 = T.DarkContrast}) end)
	close.MouseButton1Click:Connect(function() self:Destroy() end)

	minimize.MouseEnter:Connect(function() tween(minimize, 0.12, {BackgroundColor3 = T.Minimize}) end)
	minimize.MouseLeave:Connect(function() tween(minimize, 0.12, {BackgroundColor3 = T.DarkContrast}) end)
	minimize.MouseButton1Click:Connect(function() self:SetMinimized(not self.minimized) end)

	local key = enumKeyCodeFrom(toggleKey, Enum.KeyCode.RightShift)
	if key then
		table.insert(self.connections, UserInputService.InputBegan:Connect(function(input, processed)
			if not processed and input.KeyCode == key then self:Toggle() end
		end))
	end

	self:_registerBaseConfig()
	self:LoadConfig()
	local requestedLocale = self:GetConfig("moonware.locale", BRAND.Localization.Default)
	if not self:SetLocale(requestedLocale, true) then
		warn(LOAD_FAILED_MESSAGE)
		self:SetLocale("en", true)
	end
	self:_ensureInfoPage()
	return self
end

function Library:SetMinimized(value: boolean)
	self.minimized = value == true
	local goal = self.minimized and UDim2.fromOffset(511, 38) or UDim2.fromOffset(511, 428)
	tween(self.main, 0.22, {Size = goal})
end

function Library:Toggle(force: boolean?)
	if force == nil then self.visible = not self.visible else self.visible = force end
	self.container.Enabled = self.visible
end

function Library:Unload(...: any)
	local args = table.pack(...)
	self.unloadCallbacks = self.unloadCallbacks or {}
	for index = #self.unloadCallbacks, 1, -1 do
		local item = self.unloadCallbacks[index]
		if typeof(item) == "RBXScriptConnection" then
			pcall(function() item:Disconnect() end)
		elseif typeof(item) == "Instance" then
			pcall(function() item:Destroy() end)
		elseif type(item) == "function" then
			task.spawn(function() pcall(item, table.unpack(args, 1, args.n)) end)
		elseif type(item) == "table" then
			if type(item.Unload) == "function" then pcall(function() item:Unload(table.unpack(args, 1, args.n)) end) end
			if type(item.Destroy) == "function" then pcall(function() item:Destroy() end) end
			if type(item.Disconnect) == "function" then pcall(function() item:Disconnect() end) end
		end
	end
	self.unloadCallbacks = {}
end

function Library:OnUnload(callbackOrObject: any): any
	assert(callbackOrObject ~= nil, self:T("unload_expected", "OnUnload expects function/object/connection/instance"))
	self.unloadCallbacks = self.unloadCallbacks or {}
	table.insert(self.unloadCallbacks, callbackOrObject)
	return callbackOrObject
end

function Library:Destroy(...: any)
	self:Unload(...)
	for _, connection in ipairs(self.connections) do connection:Disconnect() end
	self.connections = {}
	if self.container then self.container:Destroy() end
end

function Library:Notify(titleText: string?, bodyText: string?, duration: number?)
	local toast = create("Frame", {
		Name = self:T("notification_title", "Notification"),
		Size = UDim2.fromOffset(280, 74),
		Position = UDim2.new(1, -294, 1, -88),
		BackgroundColor3 = T.Background,
		BorderSizePixel = 0,
		ZIndex = 30,
		Parent = self.container,
	}, {corner(6), stroke(T.Border, 1)}) :: Frame
	create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 20), Position = UDim2.fromOffset(10, 8),
		BackgroundTransparency = 1, Font = Enum.Font.GothamSemibold,
		Text = titleText or self:T("notification_title", "Notification"), TextColor3 = T.TextColor, TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 31, Parent = toast,
	})
	create("TextLabel", {
		Size = UDim2.new(1, -20, 1, -32), Position = UDim2.fromOffset(10, 28),
		BackgroundTransparency = 1, Font = Enum.Font.Gotham,
		Text = bodyText or "", TextColor3 = T.MutedText, TextSize = 11,
		TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top, ZIndex = 31, Parent = toast,
	})
	task.delay(duration or 3, function()
		if toast.Parent then
			tween(toast, 0.18, {BackgroundTransparency = 1})
			task.wait(0.2)
			if toast.Parent then toast:Destroy() end
		end
	end)
end

-- Конфиги: branding/theme никогда не входят в payload и не могут быть зарегистрированы.
function Library:RegisterConfig(key: string, defaultValue: any, validator: ((any) -> boolean)?, onChanged: ((any) -> ())?)
	assert(type(key) == "string" and key:match("^[%w_%.%-]+$"), self:T("config_key_invalid", "Invalid config key"))
	assert(not key:match("^_") and not key:lower():match("brand") and not key:lower():match("theme") and not key:lower():match("title"), self:T("config_key_reserved", "This key is reserved by the library"))
	assert(isSafeConfigValue(defaultValue), self:T("config_value_unsupported", "Unsupported config value type"))
	if validator then assert(type(validator) == "function", self:T("config_validator_error", "validator must be a function")) end
	self.configSchema[key] = {Default = deepCopy(defaultValue), Validator = validator}
	if self.configValues[key] == nil then self.configValues[key] = deepCopy(defaultValue) end
	if onChanged then
		self.configListeners[key] = self.configListeners[key] or {}
		table.insert(self.configListeners[key], onChanged)
	end
	return self.configValues[key]
end

function Library:GetConfig(key: string, fallback: any?): any
	local value = self.configValues[key]
	if value == nil then return fallback end
	return deepCopy(value)
end

function Library:SetConfig(key: string, value: any, skipSave: boolean?): boolean
	local schema = self.configSchema[key]
	assert(schema, self:T("config_register_first", "Register the key through RegisterConfig first: ") .. tostring(key))
	if not isSafeConfigValue(value) then return false end
	if schema.Validator and not schema.Validator(value) then return false end
	self.configValues[key] = deepCopy(value)
	for _, listener in ipairs(self.configListeners[key] or {}) do
		task.spawn(listener, deepCopy(value))
	end
	if self.autoSave and not skipSave then self:SaveConfig() end
	return true
end

function Library:LoadConfig(): boolean
	local ok, payload = pcall(function() return self.configAdapter:Read() end)
	if not ok or type(payload) ~= "table" then return false end
	local values = payload.values or payload
	if type(values) ~= "table" then return false end
	for key, schema in pairs(self.configSchema) do
		local value = values[key]
		if value ~= nil and isSafeConfigValue(value) and (not schema.Validator or schema.Validator(value)) then
			self.configValues[key] = deepCopy(value)
		end
	end
	return true
end

function Library:SaveConfig(): boolean
	local values = {}
	for key, schema in pairs(self.configSchema) do
		local value = self.configValues[key]
		if value == nil then value = schema.Default end
		values[key] = deepCopy(value)
	end
	local payload = {version = BRAND.Version, values = values}
	local ok, result = pcall(function() return self.configAdapter:Write(payload) end)
	return ok and result ~= false
end

function Library:ExportConfig(): string
	local values = {}
	for key, schema in pairs(self.configSchema) do values[key] = deepCopy(self.configValues[key] or schema.Default) end
	return HttpService:JSONEncode({version = BRAND.Version, values = values})
end

function Library:ImportConfig(json: string): boolean
	local ok, payload = pcall(function() return HttpService:JSONDecode(json) end)
	if not ok or type(payload) ~= "table" or type(payload.values) ~= "table" then return false end
	for key, schema in pairs(self.configSchema) do
		local value = payload.values[key]
		if value ~= nil and isSafeConfigValue(value) and (not schema.Validator or schema.Validator(value)) then
			self:SetConfig(key, value, true)
		end
	end
	return self:SaveConfig()
end

function Library:addPage(titleText: any, _icon: any?): any
	local localizedKey: string? = nil
	local displayTitle = tostring(titleText)
	if type(titleText) == "table" then
		localizedKey = titleText.key or ("page." .. tostring(#self.pages + 1))
		displayTitle = self:RegisterLocaleKey(localizedKey, titleText)
	end
	local button = create("TextButton", {
		Name = "PageButton",
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundColor3 = T.LightContrast,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		Text = "   " .. displayTitle,
		TextColor3 = T.TextColor,
		TextTransparency = 0.48,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = self.pagesContainer,
	}, {corner(4)}) :: TextButton

	local content = create("ScrollingFrame", {
		Name = "Page_" .. displayTitle,
		Size = UDim2.new(1, -142, 1, -56),
		Position = UDim2.fromOffset(134, 46),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = T.DarkContrast,
		Visible = false,
		Parent = self.main,
	}, {
		create("UIListLayout", {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder}),
		create("UIPadding", {PaddingRight = UDim.new(0, 6)}),
	}) :: ScrollingFrame
	enableSmoothScroll(content)

	local page = setmetatable({library = self, title = displayTitle, localizedKey = localizedKey, button = button, container = content, sections = {}, _isBuiltInInfo = false}, Page)
	button.LayoutOrder = #self.pages + 1
	table.insert(self.pages, page)
	if localizedKey then
		local function applyPageTitle()
			button.Text = "   " .. self:LT(localizedKey, displayTitle)
		end
		table.insert(self.localeWatchers, applyPageTitle)
		applyPageTitle()
	end
	button.MouseEnter:Connect(function()
		if self.focusedPage ~= page then softTween(button, {TextTransparency = 0.18, BackgroundTransparency = 0.82}) end
	end)
	button.MouseLeave:Connect(function()
		if self.focusedPage ~= page then softTween(button, {TextTransparency = 0.48, BackgroundTransparency = 1}) end
	end)
	button.MouseButton1Click:Connect(function() self:SelectPage(page) end)

	local regularPages = 0
	for _, existingPage in ipairs(self.pages) do
		if not existingPage._isBuiltInInfo then regularPages += 1 end
	end
	if regularPages == 1 then self:SelectPage(page) end
	return page
end


function Library:_registerBaseConfig()
	if not self.configSchema["moonware.locale"] then
		self:RegisterConfig("moonware.locale", BRAND.Localization.Default, isAllowedLocale)
	end
end

function Library:T(key: string, fallback: string?): string
	local value = self.localeData and self.localeData[key]
	if type(value) == "string" then return value end
	return fallback or key
end

function Library:RegisterLocaleKey(key: string, values: {[string]: string}): string
	assert(type(key) == "string" and key ~= "", "Locale key must be a non-empty string")
	assert(type(values) == "table", "Locale values must be a table")
	self.appLocales[key] = self.appLocales[key] or {}
	for locale, value in pairs(values) do
		if type(locale) == "string" and type(value) == "string" then
			self.appLocales[key][locale] = value
		end
	end
	return self:LT(key, values.en or values.ru or key)
end

function Library:LT(key: string, fallback: string?): string
	local item = self.appLocales and self.appLocales[key]
	if type(item) == "table" then
		local value = item[self.locale]
		if type(value) == "string" then return value end
		if type(item.en) == "string" then return item.en end
		if type(item.ru) == "string" then return item.ru end
	end
	return fallback or key
end

function Library:BindLocalizedText(object: any, property: string, key: string, fallback: string?): any
	assert(object ~= nil, "Object is required")
	property = property or "Text"
	local target = object
	if type(target) == "table" and target.Instance then target = target.Instance end
	if typeof(target) == "Instance" and not (target:IsA("TextButton") or target:IsA("TextLabel") or target:IsA("TextBox")) then
		target = target:FindFirstChild("Title", true) or target:FindFirstChildWhichIsA("TextButton", true) or target:FindFirstChildWhichIsA("TextBox", true)
	end
	local function apply()
		pcall(function()
			if typeof(target) == "Instance" then target[property] = self:LT(key, fallback) end
		end)
	end
	apply()
	table.insert(self.localeWatchers, apply)
	return object
end

function Library:OnLocaleChanged(callback: (string) -> ()): any
	assert(type(callback) == "function", "Locale callback must be a function")
	table.insert(self.localeWatchers, function(locale)
		task.spawn(callback, locale or self.locale)
	end)
	return callback
end

function Library:_refreshLocalizedObjects()
	for _, watcher in ipairs(self.localeWatchers or {}) do
		task.spawn(watcher, self.locale)
	end
end

function Library:LoadLocale(locale: string): boolean
	if not isAllowedLocale(locale) then return false end
	local url = self.localizationUrls and self.localizationUrls[locale]
	local remote = httpGetJson(url)
	if type(remote) ~= "table" then
		warn(LOAD_FAILED_MESSAGE)
		return false
	end
	self.localeData = remote
	return true
end

function Library:SetLocale(locale: string, skipSave: boolean?): boolean
	if not self:LoadLocale(locale) then return false end
	self.locale = locale
	if self.configSchema["moonware.locale"] then
		self:SetConfig("moonware.locale", locale, skipSave == true)
	end
	self:_refreshLocalizedObjects()
	return true
end

function Library:GetLocale(): string
	return self.locale
end

function Library:RefreshInfo()
	if self.infoPage then
		self.infoPage.container:Destroy()
		self.infoPage.button:Destroy()
		self.infoPage = nil
		for index = #self.pages, 1, -1 do
			if self.pages[index]._isBuiltInInfo then table.remove(self.pages, index) end
		end
	end
	return self:_ensureInfoPage()
end

-- Встроенная вкладка всегда остаётся последней: новые страницы получают
-- обычный LayoutOrder, а Info — большой фиксированный LayoutOrder.
function Library:_ensureInfoPage()
	if self.infoPage then return self.infoPage end

	local infoPage = self:addPage(self:T("info_tab", "Info"))
	infoPage._isBuiltInInfo = true
	infoPage.button.LayoutOrder = 1_000_000
	self.infoPage = infoPage

	local section = infoPage:addSection(self:T("info_title", "MoonWare Studio"))
	section:addInfobox(
		self:T("info_title", "MoonWare Studio"),
		self:T("info_body", "News, updates, and current links. Press the button below to copy the invite.")
	)

	section:addButton(self:T("copy_discord", "Copy invite"), function()
		if tryCopy(BRAND.DiscordUrl) then
			self:Notify(self:T("discord_title", "Discord"), self:T("discord_copied", "Invite copied"))
		end
	end)

	local localeSection = infoPage:addSection(self:T("language_title", "Localization"))
	localeSection:addDropdown(self:T("language_dropdown", "Language"), BRAND.Localization.Allowed, function(value)
		local locale = tostring(value)
		if self:SetLocale(locale) then
			self:Notify("MoonWare", self:T("language_changed", "Language changed") .. ": " .. locale)
			self:RefreshInfo()
		end
	end, "moonware.locale")

	section:addInfobox(self:T("invite_title", "Invite"), "")
	section:addMarkdown(self:T("invite_body", "[https://discord.gg/SHGng2D9te](https://discord.gg/SHGng2D9te)  •  MoonWare Studio"))

	return infoPage
end

function Library:SelectPage(page: any)
	if self.focusedPage == page then return end
	if self.focusedPage then
		local previous = self.focusedPage
		softTween(previous.button, {TextTransparency = 0.48, BackgroundTransparency = 1})
		previous.button.Font = Enum.Font.Gotham
		previous.container.Visible = false
	end
	self.focusedPage = page
	page.container.Visible = true
	page.container.CanvasPosition = Vector2.new(0, 0)
	page.button.Font = Enum.Font.GothamSemibold
	softTween(page.button, {TextTransparency = 0, BackgroundTransparency = 0.35})
end

function Page:addSection(titleText: any): any
	local localizedKey: string? = nil
	local displayTitle = tostring(titleText)
	if type(titleText) == "table" then
		localizedKey = titleText.key or ("section." .. tostring(#self.sections + 1))
		displayTitle = self.library:RegisterLocaleKey(localizedKey, titleText)
	end
	local frame = create("Frame", {
		Name = "Section",
		Size = UDim2.new(1, 0, 0, 36),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = T.LightContrast,
		BorderSizePixel = 0,
		Parent = self.container,
	}, {corner(5), stroke(T.Border, 1)}) :: Frame
	lockColor(frame, "BackgroundColor3", T.LightContrast)
	local inner = create("Frame", {
		Name = "Container",
		Size = UDim2.new(1, -16, 0, 28),
		Position = UDim2.fromOffset(8, 8),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Parent = frame,
	}, {
		create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}),
		create("UIPadding", {PaddingBottom = UDim.new(0, 8)}),
	}) :: Frame
	local titleLabel = create("TextLabel", {
		Name = "Title", Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold, Text = displayTitle, TextColor3 = T.TextColor,
		TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = inner,
	}) :: TextLabel
	if localizedKey then self.library:BindLocalizedText(titleLabel, "Text", localizedKey, displayTitle) end
	local section = setmetatable({page = self, container = inner, modules = {}, keybinds = {}}, Section)
	table.insert(self.sections, section)
	return section
end

local function moduleFrame(section: any, height: number): Frame
	local frame = create("Frame", {
		Name = "Module", Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = T.DarkContrast, BorderSizePixel = 0,
		Parent = section.container,
	}, {corner(4)}) :: Frame
	lockColor(frame, "BackgroundColor3", T.DarkContrast)
	table.insert(section.modules, frame)
	return frame
end

local function moduleTitle(parent: Instance, text: string, widthOffset: number?): TextLabel
	return create("TextLabel", {
		Name = "Title", Size = UDim2.new(1, widthOffset or -20, 1, 0), Position = UDim2.fromOffset(10, 0),
		BackgroundTransparency = 1, Font = Enum.Font.Gotham, Text = text,
		TextColor3 = T.TextColor, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left,
		Parent = parent,
	}) :: TextLabel
end

local function resolveLocalizedText(lib: any, value: any, fallbackKey: string?): (string, string?)
	if type(value) == "table" then
		local key = value.key or fallbackKey or tostring(value.en or value.ru or "localized")
		local text = lib:RegisterLocaleKey(key, value)
		return text, key
	end
	return tostring(value or ""), nil
end

local function bindTitleIfLocalized(lib: any, label: TextLabel, key: string?, fallback: string?)
	if key then lib:BindLocalizedText(label, "Text", key, fallback or label.Text) end
end

function Section:addButton(titleText: any, callback: (() -> ())?): TextButton
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "button." .. tostring(#self.modules + 1))
	local frame = moduleFrame(self, 30)
	local button = create("TextButton", {
		Name = "Button", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
		Font = Enum.Font.Gotham, Text = displayTitle, TextColor3 = T.TextColor,
		TextSize = 12, AutoButtonColor = false, Parent = frame,
	}) :: TextButton
	if localizedKey then lib:BindLocalizedText(button, "Text", localizedKey, displayTitle) end
	safeConnect(button.MouseButton1Click, "Button", function()
		tween(frame, 0.08, {BackgroundTransparency = 0.28})
		task.delay(0.1, function() if frame.Parent then tween(frame, 0.1, {BackgroundTransparency = 0}) end end)
		protectCallback("Button", callback)
	end)
	return button
end

function Section:addToggle(titleText: any, default: boolean?, callback: ((boolean) -> ())?, disabled: boolean?, configKey: string?): any
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "toggle." .. tostring(#self.modules + 1))
	local value = default == true
	if configKey then
		lib:RegisterConfig(configKey, value, function(v) return type(v) == "boolean" end)
		lib:LoadConfig()
		value = lib:GetConfig(configKey, value)
	end
	local frame = moduleFrame(self, 30)
	local label = moduleTitle(frame, displayTitle, -64)
	bindTitleIfLocalized(lib, label, localizedKey, displayTitle)
	local track = create("Frame", {
		Name = "Track", Size = UDim2.fromOffset(40, 16), Position = UDim2.new(1, -50, 0.5, -8),
		BackgroundColor3 = disabled and Color3.fromRGB(25, 25, 27) or T.LightContrast,
		BorderSizePixel = 0, Parent = frame,
	}, {corner(8)}) :: Frame
	local knob = create("Frame", {
		Name = "Knob", Size = UDim2.fromOffset(12, 12),
		BackgroundColor3 = disabled and Color3.fromRGB(60, 60, 65) or T.TextColor,
		BorderSizePixel = 0, Parent = track,
	}, {corner(6)}) :: Frame
	local button = create("TextButton", {
		Name = "Hitbox", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
		Text = "", AutoButtonColor = false, Active = not disabled, Parent = frame,
	}) :: TextButton
	if disabled then label.TextTransparency = 0.55 end
	local function render()
		knob.Position = value and UDim2.new(1, -14, 0, 2) or UDim2.fromOffset(2, 2)
	end
	render()
	safeConnect(button.MouseButton1Click, "Toggle", function()
		if disabled then return end
		value = not value
		render()
		if configKey then lib:SetConfig(configKey, value) end
		protectCallback("Toggle", callback, value)
	end)
	return {Instance = frame, Label = label, Get = function() return value end, Set = function(_, v)
		if disabled then return end
		value = v == true; render(); if configKey then lib:SetConfig(configKey, value) end
	end}
end

function Section:addSlider(titleText: any, default: number?, minValue: number, maxValue: number, callback: ((number) -> ())?, disabled: boolean?, configKey: string?): any
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "slider." .. tostring(#self.modules + 1))
	local minNumeric = tonumber(minValue) or 0
	local maxNumeric = tonumber(maxValue)
	if maxNumeric == nil then maxNumeric = minNumeric + 1 end
	if maxNumeric == minNumeric then maxNumeric = minNumeric + 1 end
	if maxNumeric < minNumeric then minNumeric, maxNumeric = maxNumeric, minNumeric end

	local value = clampNumber(default, minNumeric, maxNumeric)
	if configKey then
		lib:RegisterConfig(configKey, value, function(v)
			local n = tonumber(v)
			return n ~= nil and n >= minNumeric and n <= maxNumeric
		end)
		lib:LoadConfig(); value = clampNumber(lib:GetConfig(configKey, value), minNumeric, maxNumeric)
	end
	local frame = moduleFrame(self, 50)
	local label = moduleTitle(frame, displayTitle, -58)
	bindTitleIfLocalized(lib, label, localizedKey, displayTitle)
	label.Size = UDim2.new(1, -58, 0, 26)
	local valueLabel = create("TextLabel", {
		Name = "Value", Size = UDim2.fromOffset(46, 26), Position = UDim2.new(1, -56, 0, 0),
		BackgroundTransparency = 1, Font = Enum.Font.GothamSemibold,
		TextColor3 = T.TextColor, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Right, Parent = frame,
	}) :: TextLabel
	local bar = create("Frame", {
		Name = "Bar", Size = UDim2.new(1, -20, 0, 4), Position = UDim2.fromOffset(10, 34),
		BackgroundColor3 = disabled and Color3.fromRGB(25, 25, 27) or T.LightContrast,
		BorderSizePixel = 0, Parent = frame,
	}, {corner(2)}) :: Frame
	local fill = create("Frame", {
		Name = "Fill", Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = disabled and Color3.fromRGB(60, 60, 65) or T.TextColor,
		BorderSizePixel = 0, Parent = bar,
	}, {corner(2)}) :: Frame
	if disabled then label.TextTransparency = 0.55; valueLabel.TextTransparency = 0.55 end
	local dragging = false
	local function render()
		local range = maxNumeric - minNumeric
		local alpha = range ~= 0 and ((value - minNumeric) / range) or 0
		alpha = clamp01(alpha)
		fill.Size = UDim2.new(alpha, 0, 1, 0)
		valueLabel.Text = tostring(value)
	end
	local function setFromX(x: number)
		if disabled or bar.AbsoluteSize.X <= 0 then return end
		local alpha = clamp01((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X)
		local nextValue = math.floor(minNumeric + (maxNumeric - minNumeric) * alpha + 0.5)
		nextValue = clampNumber(nextValue, minNumeric, maxNumeric)
		if nextValue == value then return end
		value = nextValue; render()
		if configKey then lib:SetConfig(configKey, value) end
		protectCallback("Slider", callback, value)
	end
	safeConnect(frame.InputBegan, "Slider input began", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; setFromX(input.Position.X) end
	end)
	safeConnect(frame.InputEnded, "Slider input ended", function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
	end)
	safeConnect(UserInputService.InputChanged, "Slider input changed", function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then setFromX(input.Position.X) end
	end)
	render()
	return {Instance = frame, Label = label, Get = function() return value end, Set = function(_, v)
		if disabled then return end
		value = clampNumber(v, minNumeric, maxNumeric); render(); if configKey then lib:SetConfig(configKey, value) end
	end}
end

function Section:addTextbox(titleText: any, default: string?, callback: ((string, boolean) -> ())?, configKey: string?): TextBox
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "textbox." .. tostring(#self.modules + 1))
	local value = tostring(default or "")
	if configKey then
		lib:RegisterConfig(configKey, value, function(v) return type(v) == "string" and #v <= 500 end)
		lib:LoadConfig(); value = lib:GetConfig(configKey, value)
	end
	local frame = moduleFrame(self, 34)
	frame.ClipsDescendants = true
	local titleLabel = moduleTitle(frame, displayTitle, -168)
	bindTitleIfLocalized(lib, titleLabel, localizedKey, displayTitle)

	local boxHolder = create("Frame", {
		Name = "TextboxHolder",
		Size = UDim2.fromOffset(148, 20),
		Position = UDim2.new(1, -158, 0.5, -10),
		BackgroundColor3 = T.LightContrast,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = frame,
	}, {corner(3)}) :: Frame

	local box = create("TextBox", {
		Name = "Textbox",
		Size = UDim2.new(1, -10, 1, 0),
		Position = UDim2.fromOffset(5, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClearTextOnFocus = false,
		MultiLine = false,
		TextWrapped = false,
		TextScaled = false,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextEditable = true,
		Font = Enum.Font.GothamSemibold,
		Text = value,
		PlaceholderText = lib:T("textbox_placeholder", ""),
		TextColor3 = T.TextColor,
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		ClipsDescendants = true,
		Parent = boxHolder,
	}) :: TextBox

	safeConnect(box.FocusLost, "Textbox", function(enterPressed)
		if configKey then lib:SetConfig(configKey, box.Text) end
		protectCallback("Textbox", callback, box.Text, enterPressed)
	end)
	return box
end

function Section:addKeybind(titleText: any, default: Enum.KeyCode?, callback: (() -> ())?, changedCallback: ((Enum.KeyCode) -> ())?, configKey: string?): any
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "keybind." .. tostring(#self.modules + 1))
	local current = default or Enum.KeyCode.Unknown
	if configKey then
		lib:RegisterConfig(configKey, current.Name, function(v) return type(v) == "string" and Enum.KeyCode[v] ~= nil end)
		lib:LoadConfig(); current = enumKeyCodeFrom(lib:GetConfig(configKey), current) or current
	end
	local frame = moduleFrame(self, 30)
	local titleLabel = moduleTitle(frame, displayTitle, -130)
	bindTitleIfLocalized(lib, titleLabel, localizedKey, displayTitle)
	local keyButton = create("TextButton", {
		Name = "Keybind", Size = UDim2.fromOffset(110, 18), Position = UDim2.new(1, -120, 0.5, -9),
		BackgroundColor3 = T.LightContrast, BorderSizePixel = 0, AutoButtonColor = false,
		Font = Enum.Font.GothamSemibold, Text = current.Name, TextColor3 = T.TextColor,
		TextSize = 11, Parent = frame,
	}, {corner(3)}) :: TextButton
	local capturing = false
	safeConnect(keyButton.MouseButton1Click, "Keybind capture", function() capturing = true; keyButton.Text = lib:T("keybind_capture", "...") end)
	table.insert(lib.connections, safeConnect(UserInputService.InputBegan, "Keybind input", function(input, processed)
		if capturing and input.KeyCode ~= Enum.KeyCode.Unknown then
			capturing = false; current = input.KeyCode; keyButton.Text = current.Name
			if configKey then lib:SetConfig(configKey, current.Name) end
			protectCallback("Keybind changed", changedCallback, current)
		elseif not processed and input.KeyCode == current then
			protectCallback("Keybind", callback)
		end
	end))
	return {Instance = frame, Label = titleLabel, Button = keyButton, Get = function() return current end}
end

function Section:addDropdown(titleText: any, list: {any}, callback: ((any) -> ())?, configKey: string?): any
	local lib = self.page.library
	local displayTitle, localizedKey = resolveLocalizedText(lib, titleText, "dropdown." .. tostring(#self.modules + 1))
	local selected: any = nil
	if configKey then
		if not lib.configSchema[configKey] then
			lib:RegisterConfig(configKey, "", function(v)
				if type(v) ~= "string" then return false end
				if v == "" then return true end
				for _, item in ipairs(list) do if tostring(item) == v then return true end end
				return false
			end)
		end
		lib:LoadConfig(); selected = lib:GetConfig(configKey, "")
	end
	local holder = moduleFrame(self, 30)
	holder.ClipsDescendants = true
	local button = create("TextButton", {
		Name = "Dropdown", Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1,
		Font = Enum.Font.Gotham, Text = selected ~= "" and tostring(selected) or displayTitle,
		TextColor3 = T.TextColor, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left,
		AutoButtonColor = false, Parent = holder,
	}) :: TextButton
	button.Text = "  " .. button.Text
	if localizedKey then
		local function applyDropdownTitle()
			if selected == nil or selected == "" then button.Text = "  " .. lib:LT(localizedKey, displayTitle) end
		end
		table.insert(lib.localeWatchers, applyDropdownTitle)
		applyDropdownTitle()
	end
	local open = false
	local function rebuild()
		for _, child in ipairs(holder:GetChildren()) do if child.Name == "Entry" then child:Destroy() end end
		for index, item in ipairs(list) do
			local entry = create("TextButton", {
				Name = "Entry", Size = UDim2.new(1, -8, 0, 26), Position = UDim2.fromOffset(4, 30 + (index - 1) * 28),
				BackgroundColor3 = T.LightContrast, BorderSizePixel = 0, AutoButtonColor = false,
				Font = Enum.Font.Gotham, Text = tostring(item), TextColor3 = T.TextColor,
				TextSize = 11, Parent = holder,
			}, {corner(3)}) :: TextButton
			safeConnect(entry.MouseButton1Click, "Dropdown entry", function()
				selected = item; button.Text = "  " .. tostring(item); open = false; holder.Size = UDim2.new(1, 0, 0, 30)
				if configKey then lib:SetConfig(configKey, tostring(item)) end
				protectCallback("Dropdown", callback, item)
			end)
		end
	end
	rebuild()
	safeConnect(button.MouseButton1Click, "Dropdown", function()
		open = not open
		holder.Size = UDim2.new(1, 0, 0, open and (34 + #list * 28) or 30)
	end)
	return {Instance = holder, Button = button, Get = function() return selected end}
end

function Section:addMarkdown(markdownText: any): Frame
	local lib = self.page.library
	local displayText, localizedKey = resolveLocalizedText(lib, markdownText, "markdown." .. tostring(#self.modules + 1))
	local frame = moduleFrame(self, 74)
	frame.ClipsDescendants = true

	local function clearMarkdown()
		for _, child in ipairs(frame:GetChildren()) do
			if child.Name == "MarkdownText" or child.Name == "MarkdownLink" then
				child:Destroy()
			end
		end
	end

	local function normalizeLine(line: string): (string, string?)
		local linkStart, linkEnd, label, url = string.find(line, "%[([^%]]+)%]%(([^%)]+)%)")
		local linkUrl = nil
		if linkStart then
			local before = string.sub(line, 1, linkStart - 1)
			local after = string.sub(line, linkEnd + 1)
			line = before .. tostring(label or "") .. after
			linkUrl = tostring(url or "")
		end
		line = string.gsub(line, "^%s*%-%s+", "- ")
		line = stripBasicMarkdown(line)
		return line, linkUrl
	end

	local function renderMarkdown(textValue: string)
		clearMarkdown()
		local rawText = tostring(textValue or "")
		local lines = string.split(rawText, "\n")
		local count = math.max(1, #lines)
		frame.Size = UDim2.new(1, 0, 0, math.max(34, 14 + count * 18))

		local y = 7
		for _, rawLine in ipairs(lines) do
			local line, linkUrl = normalizeLine(tostring(rawLine or ""))
			if line ~= "" then
				local isLink = linkUrl ~= nil and linkUrl ~= ""
				local label = create("TextButton", {
					Name = isLink and "MarkdownLink" or "MarkdownText",
					Size = UDim2.new(1, -20, 0, 18),
					Position = UDim2.fromOffset(10, y),
					BackgroundTransparency = 1,
					Font = Enum.Font.Gotham,
					Text = line,
					TextColor3 = isLink and Color3.fromRGB(65, 115, 210) or T.MutedText,
					TextSize = 11,
					TextWrapped = false,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					AutoButtonColor = false,
					Active = isLink,
					Selectable = isLink,
					Parent = frame,
				}) :: TextButton
				if isLink then
					label.MouseEnter:Connect(function() pcall(function() softTween(label, {TextColor3 = Color3.fromRGB(40, 90, 185)}) end) end)
					label.MouseLeave:Connect(function() pcall(function() softTween(label, {TextColor3 = Color3.fromRGB(65, 115, 210)}) end) end)
					safeConnect(label.MouseButton1Click, "Markdown link", function()
						local copied = tryCopy(linkUrl)
						lib:Notify(lib:T("markdown_title", "Markdown"), copied and lib:T("markdown_copied", "Link copied") or tostring(linkUrl), 2)
					end)
				end
			end
			y += 18
		end
	end

	protectUi("Markdown", frame, function()
		renderMarkdown(displayText)
	end)
	if localizedKey then
		table.insert(lib.localeWatchers, function()
			renderMarkdown(lib:LT(localizedKey, displayText))
		end)
	end
	return frame
end

function Section:addInfobox(titleText: any, bodyText: any): Frame
	local lib = self.page.library
	-- nil сохраняет старое поведение (дефолтный "Info"), "" остаётся пустой строкой,
	-- таблица {key=,en=,ru=} локализуется так же, как во всех остальных addX.
	local titleKey: string? = nil
	local displayTitle: string
	if titleText == nil then
		displayTitle = lib:T("info_default_title", "Info")
	else
		displayTitle, titleKey = resolveLocalizedText(lib, titleText, "infobox_title." .. tostring(#self.modules + 1))
	end
	local displayBody, bodyKey = resolveLocalizedText(lib, bodyText, "infobox_body." .. tostring(#self.modules + 1))

	local frame = moduleFrame(self, 62)
	local titleLabel, bodyLabel
	protectUi("Infobox", frame, function()
	titleLabel = create("TextLabel", {
		Name = "InfoTitle", Size = UDim2.new(1, -20, 0, 20), Position = UDim2.fromOffset(10, 5),
		BackgroundTransparency = 1, Font = Enum.Font.GothamSemibold, Text = displayTitle,
		TextColor3 = T.TextColor, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = frame,
	})
	bodyLabel = create("TextLabel", {
		Name = "InfoBody", Size = UDim2.new(1, -20, 1, -28), Position = UDim2.fromOffset(10, 25),
		BackgroundTransparency = 1, Font = Enum.Font.Gotham, Text = displayBody,
		TextColor3 = T.MutedText, TextSize = 11, TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, Parent = frame,
	})
	end)
	if titleKey and titleLabel then bindTitleIfLocalized(lib, titleLabel, titleKey, displayTitle) end
	if bodyKey  and bodyLabel  then bindTitleIfLocalized(lib, bodyLabel,  bodyKey,  displayBody)  end
	return frame
end

-- Намеренно отсутствуют setTheme, setTitle и доступ к BRAND.
return table.freeze(Library)
