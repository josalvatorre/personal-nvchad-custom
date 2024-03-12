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
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufEnter",
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
      })
    end
  },
}
return plugins
