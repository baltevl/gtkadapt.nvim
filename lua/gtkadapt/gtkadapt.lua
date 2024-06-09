local uv = vim.uv

local cmd = "gsettings"
local cmd_args = {"monitor", "org.gnome.desktop.interface", "color-scheme"}

local stdout = uv.new_pipe()
if not stdout then
        return
end

local _, _ = uv.spawn(cmd, {args = cmd_args, stdio = {nil , stdout, nil}})

local timer = uv.new_timer()
if not timer then
        return
end

uv.timer_start(timer, 100, 1000, function ()
        stdout:read_start(function (err, data)
                assert(not err, err)
                if (data == nil) then
                        return
                end
                print(data)
        end)
end)
