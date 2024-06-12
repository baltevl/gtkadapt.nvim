local dbus = require("gtkadapt.utils.dbus")
local timer = require("gtkadapt.utils.timer")
local M = {}

function M.setup(opts)
  -- TODO: proper opts checking
  if not opts or not opts.themes then
    return
  end
  dbus.setup_connection()
  timer.register_timer(opts.themes, opts.refreshrate)
end

return M
