local ldbus = require("ldbus")
local M = {}
local connection = nil


M.setup_connection = function ()
  connection = assert(ldbus.bus.get("session"))
end

M.get_theme_value = function ()
  if not connection then
    M.setup_connection()
  end

	local msg = assert(
	  ldbus.message.new_method_call(
		  "org.freedesktop.portal.Desktop",
		  "/org/freedesktop/portal/desktop",
		  "org.freedesktop.portal.Settings",
		  "Read"),
	  "Message Null")

	local iter = ldbus.message.iter.new()
	msg:iter_init_append(iter)

	iter:append_basic("org.freedesktop.appearance")
	iter:append_basic("color-scheme")

	local reply = assert(connection:send_with_reply_and_block(msg))

  assert(reply:iter_init(iter), "Reply has no arguments")

	local subiter = ldbus.message.iter.new ( )
	assert(iter:recurse(subiter), "No recursable")
	local sub_sub_iter = ldbus.message.iter.new ( )
	assert(subiter:recurse(sub_sub_iter), "sub-iter not recursable")
	local theme_value = sub_sub_iter:get_basic()

  return theme_value
end

return M
