return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.pretty_php,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cfn_lint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.formatting.phpcbf,






      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end
}
