-- Set to 1, Neovim will open the preview window after entering the Markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 0

-- Set to 1, Neovim will auto close the current preview window when changing
-- from Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- Set to 1, Neovim will refresh Markdown when saving the buffer or
-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
-- move the cursor
-- default: 0
vim.g.mkdp_refresh_slow = 0

-- Set to 1, the MarkdownPreview command can be used for all files,
-- by default it can be used in Markdown files only
-- default: 0
vim.g.mkdp_command_for_global = 0

-- Set to 1, the preview server is available to others in your network.
-- By default, the server listens on localhost (127.0.0.1)
-- default: 0
vim.g.mkdp_open_to_the_world = 0

-- Use custom IP to open preview page.
-- Useful when you work in remote Neovim and preview on local browser.
-- For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
vim.g.mkdp_open_ip = ''

-- Specify browser to open preview page
-- For path with space
-- valid: `/path/with\ space/xxx`
-- invalid: `/path/with\\ space/xxx`
-- default: ''
vim.g.mkdp_browser = ''

-- Set to 1, echo preview page URL in command line when opening preview page
-- default: 0
vim.g.mkdp_echo_preview_url = 0

-- A custom Neovim function name to open preview page
-- This function will receive URL as a param
-- default: empty
vim.g.mkdp_browserfunc = ''

-- Options for Markdown rendering
-- mkit: markdown-it options for rendering
-- katex: KaTeX options for math
-- uml: markdown-it-plantuml options
-- maid: mermaid options
-- disable_sync_scroll: whether to disable sync scroll, default: 0
-- sync_scroll_type: 'middle', 'top', or 'relative', default: 'middle'
-- hide_yaml_meta: whether to hide YAML metadata, default: 1
-- sequence_diagrams: js-sequence-diagrams options
-- content_editable: if enable content editable for preview page, default: false
-- disable_filename: if disable filename header for preview page, default: 0
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- Use a custom Markdown style. Must be an absolute path
-- like '/Users/username/markdown.css' or vim.fn.expand('~/markdown.css')
vim.g.mkdp_markdown_css = ''

-- Use a custom highlight style. Must be an absolute path
-- like '/Users/username/highlight.css' or vim.fn.expand('~/highlight.css')
vim.g.mkdp_highlight_css = ''

-- Use a custom port to start server or empty for random
vim.g.mkdp_port = ''

-- Preview page title
-- ${name} will be replaced with the file name
vim.g.mkdp_page_title = '「${name}」'

-- Use a custom location for images
-- vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- Recognized filetypes
-- These filetypes will have MarkdownPreview commands
vim.g.mkdp_filetypes = { 'markdown' }

-- Set default theme (dark or light)
-- By default the theme is defined according to the preferences of the system
vim.g.mkdp_theme = 'dark'

-- Combine preview window
-- default: 0
-- If enabled, it will reuse previously opened preview window when previewing a markdown file.
-- Ensure to set vim.g.mkdp_auto_close = 0 if you enable this option
vim.g.mkdp_combine_preview = 0

-- Auto refetch combined preview contents when changing markdown buffer
-- only when vim.g.mkdp_combine_preview is 1
vim.g.mkdp_combine_preview_auto_refresh = 1
