return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.pyink,
        null_ls.builtins.formatting.cmakelang,
        null_ls.builtins.formatting.ast_grep,
        null_ls.builtins.completion.emmet_language_server,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.diagnostics.glint,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.cmakelang,
        null_ls.builtins.diagnostics.flakeheaven,
        null_ls.builtins.diagnostics.ast_grep,

        null_ls.builtins.completion.glint,
        null_ls.builtins.completion.ast_grep,
        null_ls.builtins.completion.cssls,
        null_ls.builtins.completion.bashls,
        null_ls.builtins.completion.lua_ls,
        null_ls.builtins.completion.intelephensel,




      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end
}
