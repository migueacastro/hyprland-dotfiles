return {
  'jedrzejboczar/possession.nvim',
  name = 'possession',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local config = require('possession')
    config.setup({
      autosave = {
        current = true,
        tmp = true,
        on_load = true,
        on_quit = true,
        tmp_name = 'tmp',
        cwd = true,
      },
      autoload = 'auto_cwd',
      commands = {
        save = 'SSave',
        load = 'SLoad',
        delete = 'SDelete',
        list = 'SList',
      },
      plugins = {
        delete_buffers = false;
      }
    })
    end
}
