local builtin = require "telescope.builtin"
local state = require "telescope.actions.state"

return function(...)
  local pickers = { ... }
  if #pickers == 0 then
    pickers = {
      builtin.buffers,
      builtin.find_files,
    }
  end


  local index = 0
  local menu = {}

  function menu.cycle(step)
    step = step or 1
    index = (index + step) % #pickers
    pickers[index + 1] { default_text = state.get_current_line() }
  end

  function menu.next() menu.cycle(1) end

  function menu.previous() menu.cycle(-1) end

  return setmetatable(menu, {
    __call = function(opts)
      index = 0
      pickers[index + 1](opts)
    end
  })
end
