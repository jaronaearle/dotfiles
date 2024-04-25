local un = "jaron.earle"
local prod_pw = "3X6@+#C=ZpY?Nc9W"
local stage_pw = "pWVZ3&s63Brw@vfa"

return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install("go")
  end,
  config = function()
    require("dbee").setup({
      sources = {
        require("dbee.sources").EnvSource:new("DB_CONNECTIONS"),
        -- require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
      },
    })
  end,
}
