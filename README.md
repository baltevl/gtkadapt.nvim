# gtkadapt.nvim

This plugin aims to bring toggling between light and dark mode to neovim.  

The code is heavily based on https://github.com/Sewdohe/Nvim-Adapt.

## Installation

Right now installation is quiet cumbersome.
Add this to your lazy config, read the docs for luarocks and ldbus.
```
{
  "baltevl/gtkadapt.nvim",
  lazy = false, -- 
  opts = {},
  dependencies = {
     {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        opts = {
           rocks = { "ldbus "}
        }
     },
  }
}
```

I also had to make some modifications to luarocks rocks.lua file:
```
	local output = vim.fn.system({
		paths.luarocks,
		"install",
		"--lua-version=5.1",
		"--server='https://luarocks.org/dev'", -- changed to diffrent url
		"--deps-only",
		"DBUS_INCDIR=/usr/include/dbus-1.0/", -- added see ldbus README
		"DBUS_ARCH_INCDIR=/usr/lib64/dbus-1.0/include", -- added ldbus README
		paths.rockspec,
	})
```
