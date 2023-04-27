local alpha = require'alpha'
local startify = require'alpha.themes.startify'
startify.section.bottom_buttons.val = {
  startify.button("h", "home-manager config", ":e ~/.config/home-manager/home.nix<CR>"),
  startify.button("c", "neovim       config", ":e ~/.config/nvim/init.lua<CR>"),
  startify.button("z", "zshrc        config", ":e ~/.zshrc<CR>"),
  startify.button("g", "git          config", ":e ~/.gitconfig<CR>"),
  startify.button("s", "neovim       swaps", ":e ~/.gitconfig<CR>"),
  startify.button("q", "quit", ":qa<CR>"),
}
alpha.setup(startify.config)

