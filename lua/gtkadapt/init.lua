local M = {}

function M.setup()
   vim.keymap.set("n", "<Leader>v", function()
         vim.notify("hello")
   end)
end

return M
