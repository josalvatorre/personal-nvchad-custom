local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "efm",
        -- TODO pyright requires npm, which I'm reluctant to install.
        "pyright",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
}
return plugins

