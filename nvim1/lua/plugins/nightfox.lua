return { 
  "EdenEast/nightfox.nvim",
  name = "nightfox",
  config = function()
    require('nightfox').setup()
    vim.cmd.colorscheme "duskfox" 
  end
}
