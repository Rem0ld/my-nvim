return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"jose-elias-alvarez/typescript.nvim",
		"folke/neodev.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"b0o/schemastore.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePost", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ timeout = 2000, bufnr = bufnr })
					end,
				})
			end
		end

		local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		local capabilities = _cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
			or vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local servers = {
			"bashls",
			"sumneko_lua",
			"cssls",
			"html",
			"emmet_ls",
			"jsonls",
			"yamlls",
			"dockerls",
			"sumneko_lua",
			"tsserver",
			"eslint",
			"rust_analyzer",
			"null_ls",
		}
		for _, server in ipairs(servers) do
			require("v.plugins.lsp." .. server).setup(on_attach, capabilities)
		end

		vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })

		vim.diagnostic.config({
			virtual_text = {
				source = "always",
				prefix = "▎",
				spacing = 6,
			},
			float = {
				source = "always",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}
