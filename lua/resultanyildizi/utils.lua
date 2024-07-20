function TableConcat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

function StringContains(str, substr)
  return string.find(str, substr) ~= nil
end

function GetFilename(file_path)
  return file_path:match("([^/\\]+)$")
end

function SplitTextByNewLine(text)
  local lines = {}
  -- Iterate through the text by lines
  for line in text:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  return lines
end
