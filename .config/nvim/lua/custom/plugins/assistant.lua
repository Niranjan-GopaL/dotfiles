return {
  "A7lavinraj/assistant.nvim",
  lazy = false,
  keys = {
    {
      "<leader>cpp",
      function()
        require("assistant").run("cpp")
      end,
      desc = "Run C++ with assistant.nvim",
    },
    {
      "<leader>py",
      function()
        require("assistant").run("python")
      end,
      desc = "Run Python with assistant.nvim",
    },
  },
  config = function()
    require("assistant").setup({
      commands = {
        cpp = {
          extension = "cpp",
          compile = {
            main = "g++",
            args = { "$FILENAME_WITH_EXTENSION", "-o", "$FILENAME_WITHOUT_EXTENSION", "-std=c++20" },
          },
          execute = {
            main = "./$FILENAME_WITHOUT_EXTENSION",
          },
        },
        python = {
          extension = "py",
          compile = nil,
          execute = {
            main = "python3",
            args = { "$FILENAME_WITH_EXTENSION" },
          },
        },
      },
      core = {
        process_budget = 5000,
        port = 10043,
      },
      ui = {
        border = "double",
        diff_mode = true,
      },
    })
  end,
}
