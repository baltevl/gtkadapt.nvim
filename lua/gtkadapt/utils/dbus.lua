return {
  get_theme_value = function ()
    local handle = io.popen("dbus-send --type=method_call --print-reply --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.portal.Settings.Read string:org.freedesktop.appearance string:color-scheme") -- dbus magic
    if not handle then
      return 0
    end

    local msg = handle:read("*a")
    handle:close()
    if not msg then
      return 0
    end

    msg = string.match(msg, "uint32 %d")
    if not msg then
      return 0
    end
    return tonumber(string.sub(msg, -1))
  end
}
