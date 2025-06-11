local OBJECT_PATH = "/org/freedesktop/portal/desktop"
local BUS_NAME = "org.freedesktop.portal.Desktop"
local INTERFACE = "org.freedesktop.portal.Settings"
local NAMESPACE = "org.freedesktop.appearance"
local KEY = "color-scheme"

local CMD = string.format(
    "dbus-send --type=method_call --print-reply --dest=%s %s %s.Read string:%s string:%s 2>/dev/null",
  BUS_NAME,
  OBJECT_PATH,
  INTERFACE,
  NAMESPACE,
  KEY
)

return {
  get_theme_value = function()
    local handle = io.popen(CMD)
    if not handle then
      return -1
    end

    local msg = handle:read("*a")
    handle:close()
    if not msg then
      return -1
    end

    msg = string.match(msg, "uint32 %d")
    if not msg then
      return -1
    end
    return tonumber(string.sub(msg, -1))
  end,
}
