local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet

ls.add_snippets("tex", {
  s(
    "basetext",
    fmt(
      [[
        \documentclass{{article}}
        \usepackage{{graphicx}}

        \begin{{document}}

        \end{{document}}
      ]],
      {}
    )
  ),
})
