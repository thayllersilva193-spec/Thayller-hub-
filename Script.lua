--[[

    Author: @canalthayller
    Enchanted Hub maintainer: @canalthayller | Discord: @canalthayller

-- ]]

local Loader = {}
Loader.__index = Loader

function Loader.new(cfg)
    local self = setmetatable({}, Loader)
    self.cfg = cfg
    local fluentOk, fluentLib = pcall(function()
        return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    end)
    if not fluentOk or not fluentLib then
        warn("[Script Loader] Failed to load Fluent UI library!")
        return self
    end
    self.libs = { Fluent = fluentLib }
    self:_initUI()
    return self
end

function Loader:_initUI()
    local win = self.libs.Fluent:CreateWindow(self.cfg.Window)

    self.window = win
    self.tabs = {
        Scripts = win:AddTab({ Title = "Scripts", Icon = "list" }),
        Info = win:AddTab({ Title = "Info", Icon = "info" })
    }

    self:_addScriptButtons()
    self:_addInfo()
end

function Loader:_addScriptButtons()
    for _, script in pairs(self.cfg.Scripts) do
        self.tabs.Scripts:AddButton({
            Title = script.Name,
            Description = "Thayller carregando: " .. script.Name,
            Callback = function()
                self:_loadScript(script.Url)
            end
        })
    end
end

-- 🔥 AQUI É O PRINCIPAL (CLIQUE → THAYLLER)
function Loader:_loadScript(url)
    self.libs.Fluent:Notify({
        Title = "Thayller Hub 🚀",
        Content = "Entrando no script...",
        Duration = 3
    })

    wait(1)

    if self.window then
        self.window:Destroy()
    end

    if self.libs.Fluent then
        self.libs.Fluent:Unload()
    end

    pcall(function()
        loadstring(game:HttpGet(url))()
    end)
end

function Loader:_addInfo()
    self.tabs.Info:AddParagraph({
        Title = "About",
        Content = "Script Loader by @canalthayller"
    })
end

local Config = {
    Window = {
        Title        = "Thayller Hub",
        SubTitle     = "by @canalthayller",
        TabWidth     = 160,
        Size         = UDim2.fromOffset(580, 460),
        Acrylic      = true,
        Theme        = "Dark",
        MinimizeKey  = Enum.KeyCode.LeftControl
    },

    Scripts = {
        { Name = "Anti AFK", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Anti-AFK" },
        { Name = "Muscle Legends", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Muscle%20Legends" },
        { Name = "Muscle Legends (PC)", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Muscle%20Legends%20(PC)" },
        { Name = "Muscle Masters", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Muscle%20Masters" },
        { Name = "Legends of Speed", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Legends%20Of%20Speed" },
        { Name = "Ninja Legends", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Ninja%20Legends" },
        { Name = "Grow a Garden", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Grow%20A%20Garden" },
        { Name = "Basketball Legends", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Basketball%20Legends" },
        { Name = "Brainrot", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Steal%20A%20Brainrot" },
        { Name = "Fish It", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Fish%20It" },
        { Name = "Fisch", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Fisch" },
        { Name = "Escape Tsunami", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Escape%20Tsunami%20For%20Brainrot" },
        { Name = "Rivals", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Rivals" },
        { Name = "Blox Strike", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Blox%20Strike" },
        { Name = "Peta Peta", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/Peta%20Peta" },
        { Name = "TP Players", Url = "https://raw.githubusercontent.com/iblameaabis/Enchanted/refs/heads/main/TP%20Players" }
    }
}

Loader.new(Config)
