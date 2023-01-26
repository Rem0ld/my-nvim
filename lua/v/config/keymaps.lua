-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- NORMAL
-- Standard
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true })
map("n", "|", "<cmd>vsplit<cr>")
map("n", "\\", "<cmd>split<cr>")

-- Move lines
map("n", "<leader>j", ":m .+1<cr>==", { silent = true })
map("n", "<leader>k", ":m .-2<cr>==", { silent = true })

-- Better vertical navigation
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Going through quicklist
map("n", "[q", ":cp<cr><cr>", { silent = true })
map("n", "]q", ":cn<cr><cr>", { silent = true })

-- Better delete ( remove from registers )
map("n", "<leader>d", '"_d', { silent = true })

-- Lazy menu
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Show lazy menu" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neotree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus neotree" })

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
map(
  "n",
  "<leader>fF",
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})",
  { desc = "Find all files" }
)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').find_buffers()<cr>", { desc = "Find buffers" })
map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').find_marks()<cr>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').find_oldfiles()<cr>", { desc = "Find old files" })
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live grep" })
-- map("n", "<leader>fW", )
map("n", "<leader>sb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", { desc = "Git branches" })
map("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "help tags" })
map("n", "<leader>sm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { desc = "man pages" })
map("n", "<leader>sr", "<cmd>lua require('telescope.builtin').registers()<cr>", { desc = "Registers" })
map("n", "<leader>sk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })
map("n", "<leader>sc", "<cmd>lua require('telescope.builtin').commands()<cr>", { desc = "Commands" })
map("n", "<leader>sn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notify" })
map("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { desc = "Aerial" })
map("n", "<leader>lD", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", { desc = "Diagnostics" })

-- INSERT
-- Better escape
map("i", "kj", "<esc>", { silent = true })
map("i", "jj", "<esc>", { silent = true })
map("i", "kk", "<esc>", { silent = true })
map("i", "kj", "<esc>", { silent = true })

map("i", "<C-j>", "<nop>")
map("i", "<C-k>", "<nop>")
