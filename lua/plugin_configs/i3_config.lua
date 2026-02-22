local map = vim.keymap.set

-- ─── SPLITS ───────────────────────────────────────────────────────────────────
map("n", "<A-v>", "<cmd>vsplit<cr>",   { desc = "Vertical split" })
map("n", "<A-s>", "<cmd>split<cr>",    { desc = "Horizontal split" })
map("n", "<A-x>", "<cmd>close<cr>",    { desc = "Close split" })
map("n", "<A-o>", "<cmd>only<cr>",     { desc = "Close all other splits" })
map("n", "<A-=>", "<cmd>wincmd =<cr>", { desc = "Equalize splits" })

-- ─── FOCUS MOVEMENT ───────────────────────────────────────────────────────────
map("n", "<A-h>", "<cmd>wincmd h<cr>", { desc = "Focus left" })
map("n", "<A-j>", "<cmd>wincmd j<cr>", { desc = "Focus down" })
map("n", "<A-k>", "<cmd>wincmd k<cr>", { desc = "Focus up" })
map("n", "<A-l>", "<cmd>wincmd l<cr>", { desc = "Focus right" })

map("t", "<A-h>", "<C-\\><C-n><cmd>wincmd h<cr>", { desc = "Focus left (term)" })
map("t", "<A-j>", "<C-\\><C-n><cmd>wincmd j<cr>", { desc = "Focus down (term)" })
map("t", "<A-k>", "<C-\\><C-n><cmd>wincmd k<cr>", { desc = "Focus up (term)" })
map("t", "<A-l>", "<C-\\><C-n><cmd>wincmd l<cr>", { desc = "Focus right (term)" })

-- ─── RESIZE MODE ──────────────────────────────────────────────────────────────
local resize_mode = false

local function exit_resize_mode()
  resize_mode = false
  vim.keymap.del("n", "h")
  vim.keymap.del("n", "l")
  vim.keymap.del("n", "k")
  vim.keymap.del("n", "j")
  vim.notify("resize mode OFF")
end

map("n", "<A-r>", function()
  resize_mode = not resize_mode
  if resize_mode then
    map("n", "h", "<cmd>vertical resize -2<cr>")
    map("n", "l", "<cmd>vertical resize +2<cr>")
    map("n", "k", "<cmd>resize +2<cr>")
    map("n", "j", "<cmd>resize -2<cr>")
    vim.notify("resize mode ON")
  else
    exit_resize_mode()
  end
end, { desc = "Toggle resize mode" })

map("n", "<Esc>", function()
  if resize_mode then
    exit_resize_mode()
  else
    vim.cmd("nohl")
  end
end, { desc = "Exit resize mode or clear highlight" })

-- ─── MOVE BUFFERS ────────────────────────────────────────────────────────────
local function sort_wins(horizontal)
  local wins = vim.api.nvim_tabpage_list_wins(0)
  table.sort(wins, function(a, b)
    local pa = vim.api.nvim_win_get_position(a)
    local pb = vim.api.nvim_win_get_position(b)
    return horizontal and pa[2] < pb[2] or pa[1] < pb[1]
  end)
  return wins
end

local function swap_bufs(win_a, win_b)
  local buf_a = vim.api.nvim_win_get_buf(win_a)
  local buf_b = vim.api.nvim_win_get_buf(win_b)
  vim.api.nvim_win_set_buf(win_a, buf_b)
  vim.api.nvim_win_set_buf(win_b, buf_a)
end

local function move_buf(direction)
  local cur_win = vim.api.nvim_get_current_win()
  local horizontal = direction == "h" or direction == "l"
  local wins = sort_wins(horizontal)

  local idx
  for i, w in ipairs(wins) do
    if w == cur_win then idx = i break end
  end

  local target_idx = (direction == "h" or direction == "k") and idx - 1 or idx + 1
  target_idx = math.max(1, math.min(#wins, target_idx))
  if target_idx == idx then return end

  swap_bufs(cur_win, wins[target_idx])
  vim.api.nvim_set_current_win(wins[target_idx])
end

local function move_buf_edge(direction)
  local cur_win = vim.api.nvim_get_current_win()
  local horizontal = direction == "h" or direction == "l"
  local wins = sort_wins(horizontal)

  local idx
  for i, w in ipairs(wins) do
    if w == cur_win then idx = i break end
  end

  local target_idx = (direction == "h" or direction == "k") and 1 or #wins
  if target_idx == idx then return end

  local step = target_idx > idx and 1 or -1
  local win = cur_win
  local cur_idx = idx
  while cur_idx ~= target_idx do
    local next_win = wins[cur_idx + step]
    swap_bufs(win, next_win)
    win = next_win
    cur_idx = cur_idx + step
  end
  vim.api.nvim_set_current_win(wins[target_idx])
end

map("n", "<A-S-H>", function() move_buf("h") end, { desc = "Move buffer left" })
map("n", "<A-S-L>", function() move_buf("l") end, { desc = "Move buffer right" })
map("n", "<A-S-K>", function() move_buf("k") end, { desc = "Move buffer up" })
map("n", "<A-S-J>", function() move_buf("j") end, { desc = "Move buffer down" })

-- ─── BUFFERS AS WORKSPACES ────────────────────────────────────────────────────
map("n", "<A-1>", "<cmd>buffer 1<cr>", { desc = "Buffer 1" })
map("n", "<A-2>", "<cmd>buffer 2<cr>", { desc = "Buffer 2" })
map("n", "<A-3>", "<cmd>buffer 3<cr>", { desc = "Buffer 3" })
map("n", "<A-4>", "<cmd>buffer 4<cr>", { desc = "Buffer 4" })
map("n", "<A-5>", "<cmd>buffer 5<cr>", { desc = "Buffer 5" })
map("n", "<A-6>", "<cmd>buffer 6<cr>", { desc = "Buffer 6" })
map("n", "<A-7>", "<cmd>buffer 7<cr>", { desc = "Buffer 7" })
map("n", "<A-8>", "<cmd>buffer 8<cr>", { desc = "Buffer 8" })
map("n", "<A-9>", "<cmd>buffer 9<cr>", { desc = "Buffer 9" })
map("n", "<A-Tab>",   "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<A-S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<A-q>",     "<cmd>bdelete<cr>",   { desc = "Close buffer" })

-- ─── LAUNCHER ─────────────────────────────────────────────────────────────────
map("n", "<A-d>", "<cmd>Telescope find_files<cr>", { desc = "Find file" })

-- ─── TERMINAL ─────────────────────────────────────────────────────────────────
map("n", "<A-t>", "<cmd>terminal<cr>",         { desc = "Open terminal" })
map("t", "<A-t>", "<C-\\><C-n><cmd>close<cr>", { desc = "Close terminal" })

-- ─── AUTOCOMMAND — equalize splits on resize ──────────────────────────────────
vim.api.nvim_create_autocmd("VimResized", {
  callback = function() vim.cmd("wincmd =") end,
})
