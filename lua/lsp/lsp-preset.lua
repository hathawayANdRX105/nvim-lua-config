require('common.ui')

local preset = {}
-- illuminate : this plug will automatically highlight those existed symbols or words under cursor
local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    local illuminate = Check_status('illuminate')
    illuminate.on_attach(client)
  end
end

-- local function on_attach(client, bufnr)
local function on_attach(_, bufnr)
  local opts = { noremap=true, silent=true }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>pa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>pd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>pl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function disable_document_formatting(client)
  -- notify(client.name)
  if client.name == "tsserver" or client.name == "html" then
    client.resolved_capabilities.document_formatting = false
  end
end


-- more detail
-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/handlers.lua
-- default take effect in my config
preset.enable_format_on_save = function()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
  ]]
  vim.notify "Enabled format on save"
end


-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = Check_status("cmp_nvim_lsp")
capabilities.textDocument.completion.completionItem.snippetSupport = true
preset.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)


-- on_attach
preset.on_attach = function(client, bufnr)
  disable_document_formatting(client)
  on_attach(bufnr)
  lsp_highlight_document(client)
end


-- setup
preset.setup = function()
	-- Setup_diagnostics_symbol()

	local config = {
	  -- disable virtual text
	  virtual_text = true,
	  -- show signs
	  signs = true,
	  update_in_insert = true,
	  underline = true,
	  severity_sort = true,
	  float = {
	    focusable = true,
	    style = "minimal",
	    border = "rounded",
	    source = "always",
	    header = "",
	    prefix = "",
	  },
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", })
end

-- register command! for calling
vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("lsp.lsp-preset").enable_format_on_save()' ]]

return preset
