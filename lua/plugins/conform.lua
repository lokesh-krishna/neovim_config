-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters = {
        rprettify = {
          inherit = false,
          stdin = false,
          command = 'rprettify',
          args = { '$FILENAME' },
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        r = { 'rprettify' },
        quarto = { 'rprettify' },
      },
    },
  },
}
