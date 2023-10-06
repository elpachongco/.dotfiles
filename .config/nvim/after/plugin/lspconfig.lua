require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {},
          maxLineLength = 89
        }
      }
    }
  }
}


