return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "mxsdev/nvim-dap-vscode-js",
    "xdebug/vscode-php-debug",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>dc', dap.continue, {})

    local dapui = require("dapui")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end
}
