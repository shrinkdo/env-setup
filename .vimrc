
"colorscheme slate

"colors solarized
set nocompatible
set autoindent

set showcmd

" Tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" tab
nnoremap tj :tabfirst<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tk :tablast<CR>
nnoremap tn :tabnew<Space>
nnoremap td :tabclose<CR>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt

" customized tab string
if (exists("g:loaded_tabline_vim") && g:loaded_tabline_vim) || &cp
    finish
endif
let g:loaded_tabline_vim = 1

function! Tabline()
    let s = ''
    for i in range(tabpagenr('$'))
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")

        let s .= '%' . tab . 'T'
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#' )
        let s .= ' ' . tab . ':'
        let s .= (bufname != '' ? fnamemodify(bufname, ':t') . ' ' : '[No Name] ' )

        if bufmodified
            let s .= '[+] '
        endif
    endfor

    let s .= '%#TabLineFill'
    return s
endfunction
set tabline=%!Tabline()

hi TabLine      ctermfg=Black ctermbg=Green cterm=NONE
hi TabLineFill  ctermfg=Black ctermbg=Green cterm=NONE
hi TabLineSel   ctermfg=White ctermbg=red   cterm=NONE

set wildmode=list:longest,full

" User interface
set so=7
set wildmenu
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2

syntax enable


set cursorline
set background=dark
hi CursorLine ctermbg=darkred cterm=NONE ctermfg=white guibg=Grey40
hi String ctermfg=DarkGreen
hi Key ctermfg=Yellow
hi Constant ctermfg=DarkCyan
hi Comment ctermfg=Blue 
hi Function ctermfg=DarkCyan
hi Identifier ctermfg=DarkCyan
hi ErrorMsg ctermbg=Yellow ctermfg=Black
hi Statement ctermfg=LightGray
hi Include ctermfg=Yellow
hi PmenuSel ctermfg=black ctermbg=lightgray

set number
highlight LineNr ctermfg=grey

"call pathogen#infect()
"execute pathogen#infect()
"syntax on
"filtype plugin indent on

set laststatus=2
set statusline+=%F
set statusline+=\ row:\ %l\ col:\ %c

" tmux
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
autocmd VimLeave * !tmux setw automatic-rename on
