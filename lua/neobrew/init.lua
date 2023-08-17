local M = {}

-- TODO allow overriding with options like all other plugins do

M.plugin_root = vim.fn.expand("<sfile>:h:r") .. "/.."
M.homebrew_path = vim.fn.stdpath("data") .. "/homebrew"

vim.api.nvim_create_user_command("HomebrewSetup", function ()
    -- TODO test if the homebrew already exists and ask user to install if not

    -- do not override current buffer
    vim.cmd("tabnew")

    -- provide the target path to the script
    vim.cmd("terminal " .. M.plugin_root .. "/setup_homebrew.sh " .. M.homebrewwpath )
end, {})

-- TODO install and automatically run on a table to automate startup

-- add the installed stuff into PATH
vim.env.PATH = M.homebrew_path .. "/bin:" .. vim.env.PATH

return M
