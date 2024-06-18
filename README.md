# gtkadapt.nvim

This plugin aims to bring toggling between light and dark mode to neovim.  

ldbus code is based on https://github.com/Sewdohe/Nvim-Adapt.

## Installation

Add this to your lazy config.
```
{
  "baltevl/gtkadapt.nvim",
  lazy = false, -- 
  opts = {
    themes = {
      light = "astrolight",
      dark = "astrodark"
    },
    refreshrate = 1000 -- millisecs
  }
}
```
