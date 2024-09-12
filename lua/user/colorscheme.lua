-- vim.cmd "colorscheme retrobox"

--local colorscheme = "retrobox"
--
--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--if not status_ok then
--  vim.notify("colorscheme " .. colorscheme .. " not found!")
--  return
--end

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local highlights = {
      'Normal',
      'LineNr',
      'Folded',
      'NonText',
      'SpecialKey',
      'VertSplit',
      'SignColumn',
      'EndOfBuffer',
      'TablineFill', -- this is specific to how I like my tabline to look like
    }
    for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end
end,
})

-- Gruvbox
--vim.cmd("colorscheme gruvbox-material")

-- Nightfox
--vim.cmd("colorscheme nightfox")
-- Everforest
vim.cmd("colorscheme everforest")
-- Tokyo Night
-- vim.cmd("colorscheme tokyonight")
