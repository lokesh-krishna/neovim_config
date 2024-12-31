-- Autoformat
return {
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 1000,
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
        python = { 'black' },
        r = { 'rprettify' },
        quarto = { 'rprettify' },
      },
    },
  },
}
