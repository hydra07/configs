return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
      highlight = { enable = true },
      context = { enable = true },
      refactor = {
        highlight_definitions = { enable = true, clear_on_cursor_move = false },
      },
    },
  }