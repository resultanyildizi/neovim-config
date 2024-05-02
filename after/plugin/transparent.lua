table.unpack = table.unpack or unpack -- 5.1 compatibility

local function getLualineGroups()
  local groupSuffixes = {
    "lualine_b",
    "lualine_c",
    "lualine_x",
    "lualine_y",
    "lualine_z",
    "lualine_b_diff_added",
    "lualine_b_diff_removed",
    "lualine_b_diff_modified",
    "lualine_b_diagnostics_error",
    "lualine_b_diagnostics_warn",
    "lualine_b_diagnostics_info",
    "lualine_b_diagnostics_hint",
    "lualine_x_filetype_DevIconLua",
    "lualine_x_filetype_DevIconDefault",
  }

  local groups = {}

  for _, group in pairs(groupSuffixes) do
    table.insert(groups, group .. "_inactive")
    table.insert(groups, group .. "_normal")
    table.insert(groups, group .. "_visual")
    table.insert(groups, group .. "_insert")
    table.insert(groups, group .. "_replace")
    table.insert(groups, group .. "_command")
    table.insert(groups, group .. "_terminal")
  end

  return groups
end

local lualine_groups = getLualineGroups()

local bufferline_groups = {
  "BufferLineTabClose",
  "BufferlineBufferSelected",
  "BufferLineFill",
  "BufferLineBackground",
  "BufferLineSeparator",
  "BufferLineIndicatorSelected",
}

local tabline_groups = {
  "TabLine",
  "TabLineSel",
  "TabLineFil",
  "BufferTabpageFill",
  "BufferDefaultTabpageFill",
  "BufferTabpages",
  "BufferDefaultTabpages",
}
local extra_groups = TableConcat(lualine_groups, bufferline_groups)


require("transparent").setup({
  --extra_groups = "all",
  extra_groups = extra_groups,
  exclude_groups = {}, -- table: groups you don't want to clear
})
