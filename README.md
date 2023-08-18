# Neobrew - Intoxicating vim experience
Allows using [linuxbrew](https://docs.brew.sh/Homebrew-on-Linux) inside your neovim

The plugin features
- Automated installation of homebrew without superuser priviledges (mainly targeted for sandboxed use as a flatpak)
- Automated installation/update of software from homebrew (like shellcheck for example)

## Installation
Using lazy.nvim:
```lua
{
"sandorex/neobrew",
lazy = false, -- make sure to load on startup so the PATH is adjusted
priority = 999, -- make sure it loads before other package managers
config = function()
    require("neobrew").init({
        -- these are options that you can override and their defaults

        -- where to install and keep homebrew
        -- homebrew_root_path = vim.fn.stdpath("data") .. "/homebrew"

        -- packages to install automatically on initialization
        -- ensure_installed = {}
    })
end
}
```

## Goal
This project is part of my goal of hardening neovim by running it with limited permissions in a flatpak

