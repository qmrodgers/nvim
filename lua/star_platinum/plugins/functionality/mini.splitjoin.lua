return {
  'echasnovski/mini.splitjoin',
  version = false,
  config = function()
    require('mini.splitjoin').setup({
      mappings = {
        toggle = '<leader>j',
      },
    })
  end
}
