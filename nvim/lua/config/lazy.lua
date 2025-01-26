-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },

})

require("lazy.view.config").keys.details = "o"


local function get_current_tabpage(tabid)
  if require("neo-tree").config.shared_tree_across_tabs then
    return 0 -- always return a fake constant
  else
    return tabid or vim.api.nvim_get_current_tabpage()
  end
end

local function custom_toggle_terminal()
  vim.cmd("Neotree toggle")
  vim.cmd("ToggleTerm size=10 direction=horizontal name=desktop")
  vim.cmd("Neotree toggle")
end

local function toggle_terminal_mode()
  if vim.fn.mode() == 't' then
    vim.cmd('stopinsert') -- Exit terminal mode
  else
    vim.cmd('startinsert') -- Enter terminal mode
  end
end



vim.keymap.set('n', '<C-t>', custom_toggle_terminal, { silent = true, noremap = true })
vim.keymap.set('n', '<C-n>', toggle_terminal_mode, { silent = true, noremap = true })

vim.cmd("tnoremap <Esc> <C-\\><C-n>")

vim.cmd("set number")



