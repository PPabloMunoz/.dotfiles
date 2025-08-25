return {
  "mfussenegger/nvim-lint",
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      cpp = { "cpplint" }, -- enable clang-tidy for C++
      c = { "cpplint" },
    },
  },
}
