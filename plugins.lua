local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "efm",
        "lua-language-server",
        -- TODO pyright requires npm, so I should add it to the Ansible playbook.
        "pyright",
        "stylua",
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
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules
    -- I found this by searching for "treesitter nvchad" in plugins.lua files
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      auto_install = true,
    },
  },
}
return plugins
