local uv = vim.uv
local dbus = require("gtkadapt.utils.dbus")
local current_theme = nil
return {
  register_timer = function(themes, refreshrate)
    local timer = uv.new_timer()
    if not timer then
      return nil
    end

    uv.timer_start(timer, 0, refreshrate, vim.schedule_wrap(function ()
      if not themes then
        return nil
      end

      local theme
	    if dbus.get_theme_value() == 1 then
	      theme = themes.dark
	    else
	      theme = themes.light
	    end

      if not (theme == current_theme) then
        current_theme = theme
	      vim.cmd.colorscheme(theme)
	    end
    end))
  end
}
