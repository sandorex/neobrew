local M = {}

M.plugin_root = vim.fn.expand("<sfile>:h:r") .. "/.."

function M.init(options)
    M.homebrew_root_path = options.homebrew_root_path or vim.fn.stdpath("data") .. "/homebrew"

    M.homebrew_bin_path = M.homebrew_root_path .. "/bin"
    M.brew_exe_path = M.homebrew_bin_path .. "/brew"

    M.ensure_installed = options.ensure_installed or {}

    if M.ensure_installed ~= nil and next(M.ensure_installed) ~= nil then
        M.homebrew_install(M.ensure_installed)
    end

    -- prepend to PATH
    vim.env.PATH = M.homebrew_bin_path .. ":" .. vim.env.PATH
end

-- simple function to run the command in terminal in a new tab
function M.terminal_run(command)
    -- do not override current buffer
    vim.cmd("tabnew")

    vim.cmd("terminal " .. command )
end

-- TODO test if the homebrew already exists and ask user to install if not
vim.api.nvim_create_user_command("HomebrewSetup", function()
    M.terminal_run(M.plugin_root .. "/setup_homebrew.sh " .. M.homebrew_root_path)
end, {})

function M.homebrew_install(pkgs)
    M.terminal_run(M.brew_exe_path .. " install " .. table.concat(pkgs, " "))
end

vim.api.nvim_create_user_command("HomebrewInstall", function(args)
    -- wrapper so lua api is not awkward
    M.homebrew_install(args.fargs)
end, { nargs = '+' })

vim.api.nvim_create_user_command("HomebrewUpgrade", function()
    M.terminal_run(M.brew_exe_path .. " upgrade")
end, {})

return M
