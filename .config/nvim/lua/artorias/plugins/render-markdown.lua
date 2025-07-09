-- return {
-- 	"MeanderingProgrammer/render-markdown.nvim",
-- 	enabled = false,
-- 	dependencies = {
-- 		"nvim-treesitter/nvim-treesitter",
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	---@module 'render-markdown'
-- 	-- ft = { "markdown", "norg", "rmd", "org" },
-- 	init = function()
-- 		-- Define colors
-- 		local color1_bg = "#ff757f"
-- 		local color2_bg = "#4fd6be"
-- 		local color3_bg = "#7dcfff"
-- 		local color4_bg = "#ff9e64"
-- 		local color5_bg = "#7aa2f7"
-- 		local color6_bg = "#c0caf5"
-- 		local color_fg = "#1F2335"
-- 		-- -- Heading background
-- 		vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s gui=bold]], color_fg, color1_bg))
-- 		vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s gui=bold]], color_fg, color2_bg))
-- 		vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s gui=bold]], color_fg, color3_bg))
-- 		vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s gui=bold]], color_fg, color4_bg))
-- 		vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s gui=bold]], color_fg, color5_bg))
-- 		vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s gui=bold]], color_fg, color6_bg))
--
-- 		-- Heading fg
-- 		-- vim.cmd(string.format([[highlight Headline1Fg guifg=%s gui=bold]], colors.color1_bg))
-- 		-- vim.cmd(string.format([[highlight Headline2Fg guifg=%s gui=bold]], colors.color2_bg))
-- 		-- vim.cmd(string.format([[highlight Headline3Fg guifg=%s gui=bold]], colors.color3_bg))
-- 		-- vim.cmd(string.format([[highlight Headline4Fg guifg=%s gui=bold]], colors.color4_bg))
-- 		-- vim.cmd(string.format([[highlight Headline5Fg guifg=%s gui=bold]], colors.color5_bg))
-- 		-- vim.cmd(string.format([[highlight Headline6Fg guifg=%s gui=bold]], colors.color6_bg))
-- 	end,
-- 	opts = {
-- 		heading = {
-- 			sign = false,
-- 			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
-- 			backgrounds = {
-- 				"Headline1Bg",
-- 				"Headline2Bg",
-- 				"Headline3Bg",
-- 				"Headline4Bg",
-- 				"Headline5Bg",
-- 				"Headline6Bg",
-- 			},
-- 			foregrounds = {
-- 				"Headline1Fg",
-- 				"Headline2Fg",
-- 				"Headline3Fg",
-- 				"Headline4Fg",
-- 				"Headline5Fg",
-- 				"Headline6Fg",
-- 			},
-- 		},
-- 		code = {
-- 			sign = false,
-- 			width = "block",
-- 			right_pad = 1,
-- 		},
-- 		bullet = {
-- 			-- Turn on / off list bullet rendering
-- 			enabled = true,
-- 		},
-- 		-- checkbox = {
-- 		--     -- Turn on / off checkbox state rendering
-- 		--     enabled = true,
-- 		--     -- Determines how icons fill the available space:
-- 		--     --  inline:  underlying text is concealed resulting in a left aligned icon
-- 		--     --  overlay: result is left padded with spaces to hide any additional text
-- 		--     position = "inline",
-- 		--     unchecked = {
-- 		--         -- Replaces '[ ]' of 'task_list_marker_unchecked'
-- 		--         icon = "   󰄱 ",
-- 		--         -- Highlight for the unchecked icon
-- 		--         highlight = "RenderMarkdownUnchecked",
-- 		--         -- Highlight for item associated with unchecked checkbox
-- 		--         scope_highlight = nil,
-- 		--     },
-- 		--     checked = {
-- 		--         -- Replaces '[x]' of 'task_list_marker_checked'
-- 		--         icon = "   󰱒 ",
-- 		--         -- Highlight for the checked icon
-- 		--         highlight = "RenderMarkdownChecked",
-- 		--         -- Highlight for item associated with checked checkbox
-- 		--         scope_highlight = nil,
-- 		--     },
-- 		-- },
-- 	},
-- }

return {
	"MeanderingProgrammer/render-markdown.nvim",
	config = function()
		require("render-markdown").setup({
			latex = {
				enabled = true,
				render_modes = false,
				converter = "latex2text",
				highlight = "RenderMarkdownMath",
				position = "above",
				top_pad = 0,
				bottom_pad = 0,
			},
			link = {
				-- Turn on / off inline link icon rendering.
				enabled = true,
				-- Additional modes to render links.
				render_modes = false,
				-- How to handle footnote links, start with a '^'.
				footnote = {
					-- Turn on / off footnote rendering.
					enabled = true,
					-- Replace value with superscript equivalent.
					superscript = true,
					-- Added before link content.
					prefix = "",
					-- Added after link content.
					suffix = "",
				},
				-- Inlined with 'image' elements.
				image = "󰥶 ",
				-- Inlined with 'email_autolink' elements.
				email = "󰀓 ",
				-- Fallback icon for 'inline_link' and 'uri_autolink' elements.
				hyperlink = "󰌹 ",
				-- Applies to the inlined icon as a fallback.
				highlight = "RenderMarkdownLink",
				-- Applies to WikiLink elements.
				wiki = {
					icon = "󱗖 ",
					body = function()
						return nil
					end,
					highlight = "RenderMarkdownWikiLink",
				},
				-- Define custom destination patterns so icons can quickly inform you of what a link
				-- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
				-- patterns match a link the one with the longer pattern is used.
				-- The key is for healthcheck and to allow users to change its values, value type below.
				-- | pattern   | matched against the destination text                            |
				-- | icon      | gets inlined before the link text                               |
				-- | kind      | optional determines how pattern is checked                      |
				-- |           | pattern | @see :h lua-patterns, is the default if not set       |
				-- |           | suffix  | @see :h vim.endswith()                                |
				-- | priority  | optional used when multiple match, uses pattern length if empty |
				-- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
				custom = {
					web = { pattern = "^http", icon = "󰖟 " },
					github = { pattern = "github%.com", icon = "󰊤 " },
					gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
					stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
					wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
					youtube = { pattern = "youtube%.com", icon = "󰗃 " },
				},
			},
			callout = {
				-- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'.
				-- The key is for healthcheck and to allow users to change its values, value type below.
				-- | raw        | matched against the raw text of a 'shortcut_link', case insensitive |
				-- | rendered   | replaces the 'raw' value when rendering                             |
				-- | highlight  | highlight for the 'rendered' text and quote markers                 |
				-- | quote_icon | optional override for quote.icon value for individual callout       |
				-- | category   | optional metadata useful for filtering                              |

				note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
				tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
				important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
				warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
				caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
				abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
				summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo" },
				tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo" },
				info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
				todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
				hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess" },
				success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
				check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess" },
				done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
				question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
				help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn" },
				faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn" },
				attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
				failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
				fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError" },
				missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError" },
				danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
				error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError" },
				bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
				example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
				quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
				cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote" },
			},
			checkbox = {
				enabled = true,
				render_modes = false,
				bullet = false,
				right_pad = 1,
				unchecked = {
					icon = "󰄱 ",
					highlight = "RenderMarkdownUnchecked",
					scope_highlight = nil,
				},
				checked = {
					icon = "󰱒 ",
					highlight = "RenderMarkdownChecked",
					scope_highlight = nil,
				},
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				},
			},
			bullet = {
				enabled = true,
				render_modes = false,
				icons = { "●", "○", "◆", "◇" },
				ordered_icons = function(ctx)
					local value = vim.trim(ctx.value)
					local index = tonumber(value:sub(1, #value - 1))
					return ("%d."):format(index > 1 and index or ctx.index)
				end,
				left_pad = 0,
				right_pad = 0,
				highlight = "RenderMarkdownBullet",
				scope_highlight = {},
			},
			quote = { icon = "▋" },
			anti_conceal = {
				enabled = true,
				-- Which elements to always show, ignoring anti conceal behavior. Values can either be
				-- booleans to fix the behavior or string lists representing modes where anti conceal
				-- behavior will be ignored. Valid values are:
				--   head_icon, head_background, head_border, code_language, code_background, code_border,
				--   dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
				ignore = {
					code_background = true,
					sign = true,
				},
				above = 0,
				below = 0,
			},
		})
	end,
}
