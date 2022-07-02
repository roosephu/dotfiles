logger = hs.logger.new('init', 'debug')

function input_method_watcher(app, event, object)
    local target = {
        WeChat="cn",
        Code="en",
        iTerm2="en",
        QQ="cn",
        Hammerspoon="en",
        FEZ="en",
        PyCharm="en",
        -- Typora="en",
    }
    if event == hs.application.watcher.activated then
        -- hs.alert.show(app .. " | " .. hs.keycodes.currentSourceID())
        local config = target[app]
        if config == "cn" then
            hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
            hs.alert(string.format("set app '%s' to cn", app))
        elseif config == "en" then
            hs.keycodes.currentSourceID("com.apple.keylayout.US")
            hs.alert(string.format("set app '%s' to en", app))
        -- else
        --     hs.alert(app)
        end
    end
end
watcher = hs.application.watcher.new(input_method_watcher)
watcher:start()

function reload_config(files)
    do_reload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            do_reload = true
        end
    end
    if do_reload then
        hs.reload()
    end
end
watcher2 = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config)
watcher2:start()
hs.alert.show("Config loaded")

hs.loadSpoon('Seal')
spoon.Seal:bindHotkeys({show = {"cmd", "space"}})
spoon.Seal:loadPlugins({"apps", "calc", "safari_bookmarks", "screencapture", "useractions"})
spoon.Seal:refreshAllCommands()
spoon.Seal:start()

hs.loadSpoon('KSheet')
ksheet_status = false
hs.hotkey.bind({"cmd", "alt"}, "k", function ()
    if ksheet_status then
        ksheet_status = false
        spoon.KSheet:hide()
    else
        ksheet_status = true
        spoon.KSheet:show()
    end
end)
