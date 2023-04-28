local alpha = require'alpha'
local theme = require'alpha.themes.theta' 
local dashboard = require'alpha.themes.dashboard'

theme.header.val = {
  [[ $$\                           $$\               ]], 
  [[ $$ |                          $$ |              ]], 
  [[ $$$$$$$\           $$$$$$$\ $$$$$$\    $$$$$$\  ]], 
  [[ $$  __$$\ $$$$$$\ $$  _____|\_$$  _|  $$  __$$\ ]], 
  [[ $$ |  $$ |\______|\$$$$$$\    $$ |    $$$$$$$$ |]], 
  [[ $$ |  $$ |         \____$$\   $$ |$$\ $$   ____|]], 
  [[ $$$$$$$  |        $$$$$$$  |  \$$$$  |\$$$$$$$\ ]], 
  [[ \_______/         \_______/    \____/  \_______|]], 
}
-- startify.section.bottom_buttons.val = {
--   startify.button("h", "home-manager config <hm>/home.nix", ":e ~/.config/home-manager/home.nix<CR>"),
--   startify.button("c", "neovim       config <hm>/app-config/nvim/init.lua", ":e ~/.config/home-manager/app-configs/nvim/init.lua<CR>"),
--   startify.button("z", "zshrc        config", ":e ~/.zshrc<CR>"),
--   startify.button("g", "git          config", ":e ~/.gitconfig<CR>"),
--   startify.button("s", "neovim       swaps", ":e ~/.gitconfig<CR>"),
--   startify.button("q", "quit", ":qa<CR>"),
-- }


theme.buttons.val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("SPC f f", "  Find file"),
        dashboard.button("SPC f g", "  Live grep"),
        dashboard.button("v", "  Neovim config", "<cmd>cd ~/.config/home-manager/app-configs/nvim/ <CR>"),
        dashboard.button("h", "⌂  Home config", ":e ~/.config/home-manager/home.nix <CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

alpha.setup(theme.config)

