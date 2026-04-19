return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {}
      }
    }
    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fF', function() builtin.find_files({ hidden = true, no_ignore = true }) end, { desc = 'Telescope find all files' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fW', function() builtin.live_grep({ additional_args = { '--hidden', '--no-ignore' } }) end, { desc = 'Telescope all live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope find references' })
  end
}
