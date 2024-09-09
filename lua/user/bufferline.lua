local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true
bufferline.setup{
  options = {
    numbers = "none",
    separator_style = "thin",
    close_command = "Bdelete! %d",
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
        }
    },
  },
}
