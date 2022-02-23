-- In a file lua/my_debug.lua
local M = {}
local last_gdb_config

local cwd_path
local exe_path


local function load_dap()
  local ok, dap = pcall(require, 'dap')
  assert(ok, 'nvim-dap is required to use dap-cpp')
  return dap
end

local function set_exe_path()
  if exe_path == nil then
    exe_path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end

  cwd_path = vim.fn.fnamemodify(exe_path, ':h')
end

--- Register the cpp debug adapter
function M.setup()
  local dap = load_dap()

  dap.adapters.cpp = {
    type = 'executable',
    attach = {
      pidProperty = "pid",
      pidSelect = "ask"
    },
    command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
  }

  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "cpp",
      request = "launch",
      program = function()
        return exe_path
      end,
      cwd = function()
        set_exe_path()
        return cwd_path
      end,
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
      stopOnEntry = false,
      args = {}
    },
    {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'cpp',
      request = 'attach',
      pid = function()
        local output = vim.fn.system({'ps', 'a'})
        local lines = vim.split(output, '\n')
        local procs = {}
        for _, line in pairs(lines) do
          -- output format
          --    " 107021 pts/4    Ss     0:00 /bin/zsh <args>"
          local parts = vim.fn.split(vim.fn.trim(line), ' \\+')
          local pid = parts[1]
          local name = table.concat({unpack(parts, 5)}, ' ')
          if pid and pid ~= 'PID' then
            pid = tonumber(pid)
            if pid ~= vim.fn.getpid() then
              table.insert(procs, { pid = tonumber(pid), name = name })
            end
          end
        end
        local choices = {'Select process'}
        for i, proc in ipairs(procs) do
          table.insert(choices, string.format("%d: pid=%d name=%s", i, proc.pid, proc.name))
        end
        -- Would be cool to have a fancier selection, but needs to be sync :/
        -- Should nvim-dap handle coroutine results?
        local choice = vim.fn.inputlist(choices)
        if choice < 1 or choice > #procs then
          return nil
        end
        return procs[choice].pid
      end,
      args = {},
    },
  }

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return M
