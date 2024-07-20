local function moveFileToZettleKasten()
  local currFile = vim.api.nvim_buf_get_name(0)
  local noteFolder = os.getenv("note")
  if noteFolder == nil then
    error("The environment variable \"note\" is not defined in the system variables")
    return
  end

  local inNotesFolder = StringContains(currFile, noteFolder)
  if (not inNotesFolder) then
    error("The open file is not in the notes folder defined in the environemt variable \"note\"")
    return
  end

  -- Define the shell command
  local command = "ls -d */ | grep -v '^\\.'"

  -- Execute the command and capture the output
  local handle = io.popen(command)
  if handle == nil then
    error("Unexpected command error")
    return
  end
  local result = handle:read("*a") -- Read the entire output
  handle:close()

  local lines = SplitTextByNewLine(result)

  vim.ui.select(lines, { prompt = "Select the new location" }, function(choice)
    if choice == nil then
      return
    end

    local filename = GetFilename(currFile)
    local newFoder = noteFolder .. "/" .. choice
    local newFilename = newFoder .. "/" .. filename
    local success, err = os.rename(currFile, newFilename)
    if success then
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_name(buf, newFilename)
    else
      error("Error moving file: " .. err)
    end
  end)
end

vim.api.nvim_create_user_command('MoveFileToZettleKasten', moveFileToZettleKasten, {})
