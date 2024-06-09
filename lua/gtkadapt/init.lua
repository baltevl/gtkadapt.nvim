local utils = require("gtkadapt.utils.dbus")
local M = {}

function M.setup()
  utils.setup_connection()
  utils.send_and_receive()
end

return M
