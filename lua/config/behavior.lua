vim.opt.iskeyword = "a-z,A-Z,48-57,_"

vim.opt.sessionoptions:remove('folds')

vim.opt.wildmode = 'longest,list'
vim.opt.suffixes = '.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.signcolumn = 'number'

-- latex configuration
-- TODO: find somewhere else to move this
vim.g.tex_indent_brace = 0
vim.g.tex_flavor = "latex"
vim.g.tex_fast = "cmMprs"
vim.g.tex_conceal = ""
vim.g.tex_fold_enabled = 0
vim.g.tex_comment_nospell = 1
vim.g.vimtex_latexmk_enabled = 0

vim.opt.updatetime = 300

vim.opt.cursorline = true

vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = '1'

vim.opt.mouse = 'a'

vim.opt.ruler = false
vim.opt.showmode = false

vim.opt.list = true
vim.opt.listchars = {
                        tab   = '»·',
                        trail = '·'
                    }
vim.opt.fillchars = {
                        vert      = '┃',
                        foldopen  = '▾',
                        foldsep   = '│',
                        foldclose = '▸'
                    }

vim.opt.termguicolors = true
