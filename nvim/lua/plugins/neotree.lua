return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
	      visible = true,
      },
    }
  },-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  config = function()
    vim.cmd('Neotree filesystem reveal left')
    vim.cmd('Neotree toggle')
    vim.cmd('Neotree toggle') -- Xd just so that it does not open on the right side
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})

  end
}
