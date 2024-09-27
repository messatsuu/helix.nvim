-- Define a table to hold the plugin's functionality
local M = {}

local utils = require("helix.utils")

-- Setup function to map the keys directly to Lua functions
function M.setup()
    vim.keymap.set('n', 'm', utils.toggle_visual_mappings, { noremap = true, silent = true })
    vim.keymap.set('v', 'm', utils.toggle_visual_mappings, { noremap = true, silent = true })
    utils.enable_helix_mappings()
end

return M
