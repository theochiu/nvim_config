-- Delete this condition if you want to execute the file

-- Example of disabling some plugins. Add yours
local disabled = {
  {
    "autolist.nvim",
  },
}

for i, plugin in ipairs(disabled) do
  plugin.enabled = false
end

return disabled
