local ts_utils = require("nvim-treesitter.ts_utils")
local ts_query = require("nvim-treesitter.query")
local parsers = require("nvim-treesitter.parsers")
local locals = require("nvim-treesitter.locals")


local query_func = "((function_declaration name: (identifier)@function.name) @function.declaration)"
local query_method_name = [[
    ((method_declaration
     receiver: (parameter_list)@method.receiver
     name: (field_identifier)@method.name
     body:(block))@method.declaration) ]]

function GetFuncMethodNode()
  local query = query_func .. " " .. query_method_name
  local bufnr = vim.api.nvim_get_current_buf()
  
  local current_node = GetNodeAtCursor(query, bufnr)

end


function GetNodeAtCursor(query, bufnr)
  local bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "ft")

  GetAllNodes(query, bufnr, ft)
end

function GetAllNodes(query, bufnr, ft)
  local success, parsed_query = pcall( function ()
      return vim.treesitter.parse_query(ft, query)
    end)

  if not success then return nil end

  local parser = parsers.get_parser(bufnr, ft)
  local root = parser:parse()[1]:root()

  local start_row, _, end_row, _ = root:range()

  -- print("parser ======> ", vim.inspect(parser))
  -- print("root ========> ", root)
  -- print("start_row ==> ", start_row)
  -- print("end_row ====> ", end_row)
  for match in ts_query:iter_prepared_matches(parsed_query, root, bufnr, start_row, end_row) do
    print(vim.inspect(match))
  end

end
