# Neobrew - Intoxicating vim experience
Allows using [linuxbrew](https://docs.brew.sh/Homebrew-on-Linux) inside your neovim

The plugin features
- Easy installation of homebrew without superuser priviledges `:HomebrewSetup`
- Easy way to update installed packages `:HomebrewUpgrade`
- Easy installation of additional packages `:HomebrewInstall <package>`
- Automated installation of packages you use for easy bootstrapping `:HomebrewInstall`

## Installation
Using lazy.nvim:
```lua
{
	-- if you want to use it only in flatpak neovim
	-- enabled = os.getenv("container") == "flatpak",
    "sandorex/neobrew",
    lazy = false, -- make sure to load on startup so the PATH is adjusted
    priority = 999, -- make sure it loads before other package managers
    config = function()
        require("neobrew").init({
            -- these are options that you can override and their defaults

            -- where to install and keep homebrew
            -- homebrew_root_path = vim.fn.stdpath("data") .. "/homebrew"

            -- packages to install automatically when no arguments are provided to :HomebrewInstall
            -- ensure_installed = {}
        })
    end
}
```

## TODO
- Unintrusive automatic installation of packages on startup like Mason does
- Tests and running `brew doctor`

## Goal
This project is part of my goal of hardening neovim by running it with limited permissions in a flatpak
