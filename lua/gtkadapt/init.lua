local timer = require("gtkadapt.utils.timer")
return {
  setup = function(opts)
    -- TODO: proper opts checking
    if not opts or not opts.themes then
      return
    end
    timer.register_timer(opts.themes, opts.refreshrate)
  end
}
