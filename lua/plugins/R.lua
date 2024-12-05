return {
  'R-nvim/R.nvim',
  lazy = false,
  dependencies = {
    {
      'R-nvim/cmp-r',
      fun_data_1 = {
        'select',
        'rename',
        'mutate',
        'filter',
        'arrange',
      },
    },
  },
  opts = {
    -- start whenever opening a R or Quarto file
    auto_start = 'always',
    -- always open in vertical split
    rconsole_width = 0,
    -- disable assignment and pipe keymaps
    assignment_keymap = '',
    pipe_keymap = '',
    -- use visidata to view dataframes
    view_df = {
      open_app = 'terminal:vd',
      save_fun = "function(obj, obj_name) {f <- paste0(obj_name, '.parquet'); arrow::write_parquet(obj, f) ; f}",
      n_lines = 0,
    },
    -- disable direct sending of lines
    max_paste_lines = 0,
    -- split path with here
    path_split_fun = 'here',
  },
}
