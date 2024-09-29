local M = {}
local motions = require("helix.motions")
local mappings_active = false

function M.enable_helix_mappings()
    vim.keymap.set({'v', 'n'}, 'w', motions.highlight_word_forward, { noremap = true, silent = true })
    vim.keymap.set({'v', 'n'}, 'e', motions.highlight_word_end, { noremap = true, silent = true })
    vim.keymap.set({'v', 'n'}, 'b', motions.highlight_word_backward, { noremap = true, silent = true })

    vim.keymap.set({'v', 'n'}, 'j', motions.move_down, { noremap = true, silent = true })
    vim.keymap.set({'v', 'n'}, 'k', motions.move_up, { noremap = true, silent = true })

    mappings_active = true
end

-- Function to disable custom mappings in visual mode
function M.disable_helix_mappings()
    for _, mode in ipairs({'v', 'n'}) do
        vim.keymap.del(mode, 'w')
        vim.keymap.del(mode, 'e')
        vim.keymap.del(mode, 'b')

        vim.keymap.del(mode, 'j')
        vim.keymap.del(mode, 'k')
    end

    -- re-set spider motions
    vim.keymap.set({ "n", "o", "x" }, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
    vim.keymap.set({ "n", "o", "x" }, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
    vim.keymap.set({ "n", "o", "x" }, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
    vim.keymap.set({ "n", "o", "x" }, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })

    mappings_active = false
end

function M.toggle_visual_mappings()
    if mappings_active then
        M.disable_helix_mappings()
    else
        M.enable_helix_mappings()
    end
end

return M
