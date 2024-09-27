local M = {}
local spider = require('spider')

function M.escape_visual()
    mode = vim.api.nvim_get_mode().mode
    if mode == 'v' then
        vim.api.nvim_input("<esc>")
    end
end

-- Function to highlight word forward ('w')
function M.highlight_word_forward()
    M.escape_visual()
    vim.api.nvim_input("viw")
    spider.motion('w')
end

-- Function to highlight word till end ('e')
function M.highlight_word_end()
    M.escape_visual()
    vim.api.nvim_input("viw")
    spider.motion('e')
end

-- Function to highlight word backward ('b')
function M.highlight_word_backward()
    M.escape_visual()
    spider.motion('b')
    vim.api.nvim_input("viw")
    vim.api.nvim_input("o")
end

function M.move_down()
    M.escape_visual()
    vim.cmd('normal! j')
end

function M.move_up()
    M.escape_visual()
    vim.cmd('normal! k')
end

return M
