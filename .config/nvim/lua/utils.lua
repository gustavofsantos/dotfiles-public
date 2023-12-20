local format_hydra_desc = function(desc, key)
  local max_len = 15 - #key
  local length = #desc

  if length < max_len then
    desc = desc .. string.rep(" ", max_len - length)
  elseif length > max_len then
    desc = string.sub(desc, 1, max_len)
  end
  return desc
end

local build_hydra_hint = function(name, heads)
  local hint = ""

  hint = hint .. "  " .. name .. "\n  ^\n"

  for index, item in ipairs(heads) do
    local key = item[1]
    local desc = item[3].desc

    if index - 1 == 0 then
      hint = hint .. "  "
    end

    if (index - 1) % 4 == 0 and index - 1 ~= 0 then
      hint = hint .. "\n  " .. "_" .. key .. "_: " .. format_hydra_desc(desc, key) .. "  "
    elseif index == #heads then
      hint = hint .. "\n  ^\n  " .. "_" .. key .. "_: " .. format_hydra_desc(desc, key)
    else
      hint = hint .. "_" .. key .. "_: " .. format_hydra_desc(desc, key) .. "  "
    end
  end

  return hint
end

local setup_hydra = function(H, opts)
  local heads = opts.heads
  local name = opts.name
  local hint = build_hydra_hint(name, heads)

  return H(vim.tbl_deep_extend("keep", opts, {
    hint = hint,
    mode = { "n" },
    config = {
      invoke_on_body = true,
      hint = {
        border = "rounded",
      },
    },
  }))
end

return {
  setup_hydra = setup_hydra,
}
