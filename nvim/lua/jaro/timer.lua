local M = {}

function M.addTimer(fun)
  local function timedFun()
    local waitFun = fun()
    vim.defer_fn(timedFun, waitFun)
  end
  timedFun()
end
