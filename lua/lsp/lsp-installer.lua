local util = require'util'
local lsp_installer = util.check_status("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
	on_attach = require('lsp.lsp-preset').on_attach,
	capabilities = require('lsp.lsp-preset').capabilities,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    local status_ok, extra_opts = pcall(require, 'lsp.lsp-config.'..server.name)
    if status_ok then
	 opts = vim.tbl_deep_extend("force", extra_opts, opts)
    end

    server:setup(opts)
end)


