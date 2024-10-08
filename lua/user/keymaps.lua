local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", {desc = "Find files in working directory"})
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", {desc = "Find files globally"})

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Autocompletar com <Tab>
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true, silent = true })

-- Confirmar seleção com Enter
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { expr = true, noremap = true, silent = true })

-- Mostrar documentação de ajuda em hover
vim.api.nvim_set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Navegar entre diagnósticos
vim.api.nvim_set_keymap('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Go To Definition
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })

-- Renomear símbolo
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

-- Ações de código, como correções rápidas
vim.api.nvim_set_keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', { silent = true })

-- Função para colocar a linha atual no topo da tela
function LineAtTop()
  vim.cmd('normal! zt')
end
-- Mapeia a tecla <leader>t para colocar a linha atual no topo da tela
vim.api.nvim_set_keymap('n', '<leader>t', ':lua LineAtTop()<CR>', { noremap = true, silent = true, desc = "Place current line at the top"})

-- Spell check 
-- Define a função como global para evitar o aviso do LSP
function Toggle_spell()
  if vim.o.spell then
    vim.o.spell = false
    print("Spell check desativado")
  else
    vim.o.spell = true
    print("Spell check ativado")
  end
end
-- Mapeia a tecla <F5> para ativar/desativar o spell check globalmente
vim.api.nvim_set_keymap('n', '<leader>sc', ':lua Toggle_spell()<CR>', { noremap = true, silent = true })


-- Gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

-- Session Lens
vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {desc = "List existing sessions"})

-- Específico para o meu uso (Escrever documentos latex)
-- Remapeia j e k para navegação visual (considerando quebra de linha)
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Também faz o mesmo em modo visual
--vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })

-- ############################################################################
--                             Image section
-- ############################################################################

-- Para colar imagens do clipboard em Markup Languages (Markdown, Latex, etc)
vim.api.nvim_set_keymap('n', '<leader>pi', ':PasteImage<CR>', { noremap = true, silent = true })

-- ############################################################################

vim.keymap.set("n", "<leader>io", function()
  local function get_image_path()
    -- Obter a linha atual
    local line = vim.api.nvim_get_current_line()
    -- Padrão para corresponder ao caminho da imagem no Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extrair o caminho relativo da imagem
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  local image_path = get_image_path()
  if image_path then
    -- Abrir a imagem usando o eog
    vim.fn.system("eog " .. image_path)
  else
    print("Nenhuma imagem encontrada na linha atual.")
  end
end, {desc = 'Abrir imagem na aplicação do sistema'})

-- Open image under cursor in Nautilus (GNOME)
vim.keymap.set("n", "<leader>iO", function()
  local function get_image_path()
    -- Obter a linha atual
    local line = vim.api.nvim_get_current_line()
    -- Padrão para corresponder ao caminho da imagem no Markdown
    local image_pattern = "%[.-%]%((.-)%)"
    -- Extrair o caminho relativo da imagem
    local _, _, image_path = string.find(line, image_pattern)

    return image_path
  end

  local image_path = get_image_path()
  if image_path then
    -- Abrir a imagem usando o Nautilus
    vim.fn.system("nautilus " .. image_path)
  else
    print("Nenhuma imagem encontrada na linha atual.")
  end
end, {desc = 'Abrir imagem no Nautilus'})
