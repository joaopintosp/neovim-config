local servers = {
  "lua_ls",
	"pyright",
	"jsonls",
  "texlab",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end



--require("mason.nvim").setup({
--  config = function()
--    -- import mason
--    local mason = require("mason")
--
--    -- import mason-lspconfig
--    local mason_lspconfig = require("mason-lspconfig")
--
--    -- enable mason and configure icons
--    mason.setup({
--      ui = {
--        icons = {
--          package_installed = "",
--          package_pending = "",
--          package_uninstalled = ""
--        }
--      }
--    })
--
--    mason_lspconfig.setup({
--      -- list of servers for mason to install 
--      ensure_installed = {
--        "tsserver",
--        "html",
--        "cssls",
--        "tailwindcss",
--        "svelte",
--        "lua_ls",
--        "graphql",
--        "emmet_ls",
--        "prismals",
--        "pyright",
--        "texlab"
--      },
--      -- auto-install configured servers (with lsp config)
--      automatic_installation = true, -- not the same as ensure_installed
--    })
--  end,
--})
