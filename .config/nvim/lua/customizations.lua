-- Remove space key bindings
-- vimscript --- nnoremap <SPACE> <Nop>
vim.keymap.set("n", "<SPACE>", "<Nop>")

-- Set space as leaderkey
-- vimscript --- let mapleader = " "
vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.autoread = true

vim.g.mdip_imgdir = "img"
vim.g.mdip_imgname = "image"

-- --- Disable line below. Only works in tmux, not urxvt.
--vim.opt.termguicolors = true
-- Enable if tmux is terminal.
if vim.env.TERM == "screen" then
    vim.opt.termguicolors = true
end

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Remove search highlights by pressing escape
vim.keymap.set("n", "<esc>", "<esc>:noh<CR><esc>", { noremap = true, silent = true })
-- Set cursor always center
-- vim.keymap.set('n', 'k', 'kzz',{noremap = true, silent = true})
-- vim.keymap.set('n', 'j', 'jzz',{noremap = true, silent = true})
vim.o.scrolloff = 8
vim.o.cursorline = true

vim.api.nvim_set_keymap(
    "n",
    "<leader>do",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
vim.cmd("map <Leader>lf :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>")
